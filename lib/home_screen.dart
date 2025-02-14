import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:images_gallery_test/image_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imagePaths = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Images Gallery",
          style: TextStyle(color: Colors.teal),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemBuilder: (context,counter)=> ImageWidget(imagePath: imagePaths[counter]),
                itemCount: imagePaths.length,
                separatorBuilder: (_,__)=> Divider(),
              ),
            ),
            MaterialButton(
              onPressed: () async{
                // get an instance of image picker class
                final ImagePicker picker = ImagePicker();
                // open image picker to choose images from gallery
                final List<XFile> pickedImages = await picker.pickMultiImage();
                setState(() {
                  // get the images paths to show them
                  imagePaths = pickedImages.map((XFile file) => file.path).toList();
                });
              },
              minWidth: double.infinity,
              color: Colors.teal,
              child: Text('Pick Images'),
            )
          ],
        ),
      ),
    );
  }
}
