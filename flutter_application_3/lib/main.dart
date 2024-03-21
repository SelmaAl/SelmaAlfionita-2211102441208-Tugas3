import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Festival Sale App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.tokopedia.net/img/cache/900/hDjmkQ/2022/3/12/a21a3a9c-5b9a-4e6f-ba45-0f37b5c2f602.jpg',
    'https://images.tokopedia.net/img/cache/900/hDjmkQ/2024/3/20/340d1e16-9da2-451d-8248-bb5875e7a686.jpg',
    'https://images.tokopedia.net/img/cache/900/hDjmkQ/2023/4/11/037792e8-c3db-4049-9d8c-fa315f0388c2.jpg',
    'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/11/22/e13814d4-7d93-44f0-88c7-da54f93b2315.jpg',
    'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/11/23/3b6cbf88-ea3c-4a37-bd23-8f42d35f6c40.jpg',
    'https://images.tokopedia.net/img/cache/900/VqbcmM/2023/7/29/55d8b551-79b3-4dda-8ab8-e849551e08c6.jpg',
  ];

  final List<String> productNames = [
    'Abaya Turki Wanita Terbaru (Hitam)',
    'ABAYA BASIC DRESS/ ABAYA BASIC FARRASI /GAMIS ABAYA Turki (Denim)',
    'Abaya Polos Arab Saudi Baju Umroh Wanita Terbaru 2022(Olive)',
    'Gamis Abaya Modern Muslim Dress Kekinian (Sage)',
    'Abaya Set (Gamis Umroh Abaya Set Kerudung)- Soft Beige',
    'Gamis Abaya Wanita Muslim terbaru Long dress lengan panjang Ameena - White',
  ];

  final List<double> prices = [
    180.0,
    250.0,
    150.0,
    300.0,
    280.0,
    125.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abaya Fhasion'),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(14.0),
            color: Color.fromARGB(255, 23, 93, 179),
            child: Text(
              'Ramadhan Sale up to 50% OFF',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Mengubah jumlah kolom menjadi 3
                crossAxisSpacing:
                    4.0, // Mengurangi jarak horizontal antar kotak
                mainAxisSpacing: 4.0, // Mengurangi jarak vertikal antar kotak
              ),
              itemCount: productNames.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        4.0), // Mengurangi radius sudut kotak
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1, // Mengurangi bayangan kotak
                        blurRadius: 2,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: NetworkImage(
                          image: imageUrls[index],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(
                            4.0), // Mengurangi padding dalam kotak
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              productNames[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0, // Mengurangi ukuran font
                              ),
                            ),
                            Text(
                              '\$${prices[index].toStringAsFixed(2)}',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 10.0, // Mengurangi ukuran font
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NetworkImage extends StatelessWidget {
  final String image;

  NetworkImage({required this.image});

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      fit: BoxFit.cover,
    );
  }
}
