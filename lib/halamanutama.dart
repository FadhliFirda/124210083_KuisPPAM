  import 'package:flutter/material.dart';
  import 'package:kuis_124210083/data_buku.dart';
  import 'package:url_launcher/url_launcher.dart';

  class detail extends StatelessWidget {
    const detail({super.key, required this.buku});

    final DataBuku buku;


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(buku.title)
          ),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          actions: <Widget>[
            BookmarkButton(),
          ],
        ),
        body: ListView(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height/3,
                width: MediaQuery.of(context).size.width/5,
                child: Image.network(buku.imageLink)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Judul Buku:',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  buku.title,
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Pengarang:',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  buku.author,
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Tahun Terbit:',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  buku.year.toString(),
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Negara:',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  buku.country,
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontSize: 30,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    'Bahasa:',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  buku.language,
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontSize: 30,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Jumlah Halaman:',
                    style: TextStyle(
                      color: Colors.brown[900],
                      fontSize: 30,
                    ),
                  ),
                ),
                Text(
                  buku.pages.toString(),
                  style: TextStyle(
                    color: Colors.purple[900],
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _launcher(buku.link);
          },
          tooltip: 'Open Web',
          child: Icon(Icons.open_in_browser_outlined),
          backgroundColor: Colors.green,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      );
    }
    Future<void> _launcher(String url) async{
      final Uri _url = Uri.parse(url);
      if(!await launchUrl(_url)){
        throw Exception("gagal membuka url : $_url");
      }
    }
  }

  class BookmarkButton extends StatefulWidget {
    @override
    _BookmarkButtonState createState() => _BookmarkButtonState();
  }

  class _BookmarkButtonState extends State<BookmarkButton> {
    bool _isBookmarked = false;

    @override

    Widget build(BuildContext context) {
      return IconButton(
        icon: Icon(
          _isBookmarked ? Icons.bookmark : Icons.bookmark_border,
          color: _isBookmarked ? Colors.white : null,
        ),
        onPressed: () {
          setState(() {
            _isBookmarked = !_isBookmarked;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(_isBookmarked ? 'Berhasil menambahkan ke favorit.' : 'Berhasil menghapus dari favorit.'),
              backgroundColor : _isBookmarked ? Colors.lightGreen : Colors.red,
              duration: Duration(seconds: 1),
            ),
          );
        },
      );
    }
  }