// import 'dart:convert';
import 'dart:io';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
// import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'home_page.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

class InstructionPage extends StatefulWidget {
  const InstructionPage({super.key});
  // final String pdfUrl;

  // const InstructionPage({Key? key, required this.pdfUrl}) : super(key: key);


  @override
  State<InstructionPage> createState() => _InstructionPageState();
}

class _InstructionPageState extends State<InstructionPage> {
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();
  List<int>? _documentBytes;

  late String _pdfPath;

  @override
  void initState() {
    super.initState();
    _initPDFPath();
  }

  Future<void> _initPDFPath() async {
    final appDocDir = await getApplicationDocumentsDirectory();
    _pdfPath = '${appDocDir.path}/instruction_to_test_Flutter_app_on_iOS_device.pdf';
  }

  Future<void> _savePDF() async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final data = await rootBundle.load('assets/instruction_to_test_Flutter_app_on_iOS_device.pdf');
      final pdfFile = File(_pdfPath);
      await pdfFile.writeAsBytes(data.buffer.asUint8List());
    } 
    else {
      debugPrint('Permission Denied!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Instruction",
          style: TextStyle(fontSize: 30, 
          fontWeight: FontWeight.w800, 
          color: Colors.white),
        ),
        backgroundColor: Colors.grey[900],
        leading: GestureDetector(
          onTap: () => {
            Navigator.maybePop(context, MaterialPageRoute(builder: (context) => const HomePage())),
            debugPrint("Navigate to Home Page"),
          },
          child: const Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () async {
                _savePDF();
                debugPrint("Download Instruction File");
              },
              child: const Icon(
                Icons.download
              ),
            ),
          ),
        ],
      ),
      body: SfPdfViewer.asset(
        'assets/instruction_to_test_Flutter_app_on_iOS_device.pdf',
        key: _pdfViewerKey,
        onDocumentLoaded: (PdfDocumentLoadedDetails details) {
          // Document bytes of a PDF document loaded in SfPdfViewer.
          _documentBytes = details.document.saveSync();
        },
      ),

      // body: const Padding(
      //   padding: EdgeInsets.all(15),
      //   child: Align(
      //     child: Text("1. Open Xcode on Mac and go \n(Window -> Devices & Simulators)\n\n\n\n"
      //     "2. Open developer mode on iphone device\n(Setting -> Privacy & Security -> Developer Mode)\n\n\n\n"
      //     "3. Connect iphone device to Mac with cable\n\n\n\n"
      //     "4. Make sure that iphone device is unlock\n\n\n\n"
      //     "5. Open Runner.xcworkspace file in project folder\n(project folder -> ios folder-> Runner.xcworkspace)\n\n\n\n"
      //     "6. Run Flutter via Runner", 
      //       textAlign: TextAlign.center,
      //       style: TextStyle(fontSize: 13, 
      //       fontWeight: FontWeight.w800,
      //       color: Colors.black54),
      //     ),
      //   ),
      // ),
    );  
  }
}