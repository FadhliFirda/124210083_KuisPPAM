import 'package:flutter/material.dart';
import 'data_buku.dart';
import 'halamanutama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Center(
                child: Text('Data Buku')
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
          ),
          body:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemCount: listBuku.length,
                itemBuilder: (context, index) {
                  final DataBuku buku = listBuku[index];
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => detail(buku: buku)));
                    },
                    child: Card(
                      child: SizedBox(
                        height: 350,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width /5 ,
                                child: Image(
                                  image: NetworkImage(buku.imageLink),
                                  height: 350,
                                  width: 350,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Text(
                                buku.title,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ]
                        ),
                      ),
                    ),
                  );
                }
            ),
          ),
        )
    );
  }
}

