import 'package:flutter/material.dart';
import 'package:kuis_124220082_lenansya/pembayaran.dart';

class Pemesanan extends StatefulWidget {

  @override
  State<Pemesanan> createState() => _HomePageState();
}

class _HomePageState extends State<Pemesanan> {
  String _fullname = "";
  String _email = "";
  String _total_room = "";
  String _total_night = "";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('BLUE DOORZ', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        backgroundColor: const Color.fromARGB(255, 194, 17, 129),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12, 
          horizontal: 24),
          child: Center(
            child: Column(
              children: [
                Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Center(
                  child: Image.asset('assets/hotel.jpg', fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Product Name and Rating
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Blue Lagoon',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // Price Section
            const Text(
              'Price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const Text(
              'Rp 500.000/night',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                letterSpacing: 1.5,
              ),
            ),
            Center(child: Text('Booking Information', style: TextStyle(fontSize:18))) 
          ],
        ),
      ),
                const SizedBox(height: 24),
                _buildForm(),
                const SizedBox(height: 24,),
                _buildButtonSubmit()
              ],
            ),
          ),
      ),
    );
  }
  
  Widget _formInput({
    required String hint,
    required String label, 
    required Function(String value) setStateInput,
    int maxLines = 1   
  }){
    return TextFormField(
      enabled: true,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        labelText: label, 
        contentPadding: const EdgeInsets.all(12.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.purple), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: Colors.purple),
      ),
      ),
      onChanged: setStateInput
    );
  }
  Widget _buildForm() {
    return Column(
      children: [
        const SizedBox(height: 12),
        _formInput(
          hint: "Input Nama Lengkap",
          label: "Nama *",
          setStateInput: (value) {
            setState(() {
              _fullname = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Input Alamat Email",
          label: "Email *",
          setStateInput: (value) {
            setState(() {
              _email = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Input Total Room",
          label: "Total Room *",
          setStateInput: (value) {
            setState(() {
              _total_room = value;
            });
          },
        ),
        const SizedBox(height: 12),
        _formInput(
          hint: "Input Total Night",
          label: "Total Night *",
          setStateInput: (value) {
            setState(() {
              _total_night = value;
            });
          },
        ),
      ],
    );
  }
  Widget _buildButtonSubmit(){
    return Container(
      child: ElevatedButton(
        onPressed: (){
          if(_fullname == "" || _email == "" || _total_room == "" || _total_night == ""){
            SnackBar snackBar = 
            const SnackBar(content: Text("* data tidak boleh kosong"));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else{
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Pembayaran(
                fullname: _fullname,
                email: _email,
                total_room: _total_room,
                total_night: _total_night,
              );
            }));
          }
        }, 
        child: Text("Payment"),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          textStyle: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
