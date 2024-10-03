import 'package:flutter/material.dart';
import 'package:kuis_124220082_lenansya/pemesanan.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HOTEL',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        textTheme: const TextTheme(
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BLUE DOORZ', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        actions: [
           ElevatedButton(
                 onPressed: () async {
                   const url = 'https://www.traveloka.com/?id=2228962057415026507&adloc=en-id&kw=traveloka&gmt=e&gn=g&gd=c&gdm=&gcid=705639865085&gdp=&gdt=&gap=&pc=1&cp=ID_TV_SM_AU_AL_Google+-+X+-+Search-ID/en+-+B+-+X+-+X_X+|+QueryType:Brand+Pure,MT:Exact_Traveloka+|+MT:Exact&aid=167430873511&wid=kwd-51659214310&fid=&gid=9197717&utm_id=T4iqtkR9&ad_id=705639865085&target_id=kwd-51659214310&click_id=Cj0KCQjw3vO3BhCqARIsAEWblcBoIXJOmQu7rIl62535OebkLI7TPwCG773P2_sVGBpbp6R4AKnzNswaAoczEALw_wcB&group_id=167430873511&gad_source=1&gclid=Cj0KCQjw3vO3BhCqARIsAEWblcBoIXJOmQu7rIl62535OebkLI7TPwCG773P2_sVGBpbp6R4AKnzNswaAoczEALw_wcB';
                   if (await canLaunch(url)) {
                     await launch(url);
                   } else {
                     throw 'Could not launch $url';
                   }
                 },
                 style: ElevatedButton.styleFrom(
                   foregroundColor: Colors.purple, backgroundColor: Colors.white,
                 ),
                 child: const Text('About Us'),
               ), ]
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 130, 14, 130), Color.fromARGB(255, 203, 47, 224)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              // Welcome message
              Text(
                'Welcome to Blue Doorz',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black45,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // GridView for products
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: 10, // Four products
                  itemBuilder: (context, index) {
                    return _buildProductItem(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductItem(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 500,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(child: Image.asset('assets/hotel.jpg', fit: BoxFit.contain)),
          ),
          const SizedBox(height: 12),
          const Text('Blue Lagoon', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 4),
          const Text('Rp 500.000/night', style: TextStyle(color: Colors.indigo)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                return Pemesanan();
              }));
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), backgroundColor: Colors.indigo,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 5,
              shadowColor: Colors.black45,
            ),
            child: const Text('Book Now', style: TextStyle(color: Colors.white, fontSize: 16)),
          ),
        ],
      ),
    );
  }
}
