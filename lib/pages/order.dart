import 'package:flutter/material.dart';
import 'package:kuis_124220101/pages/payment.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final _fullName = TextEditingController();
  final _email = TextEditingController();
  final _ttlRoom = TextEditingController();
  final _ttlNight = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('Blue Lagoon'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          }, 
          icon: const Icon(Icons.arrow_back_ios)
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 220,
              width: double.infinity,
              color: Colors.grey[300],
              child: Image.asset('assets/photo.jpg'),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Blue Lagoon',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text('Rp 500.000/Night',style: TextStyle(color: Colors.green),),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            const Text('Booking Information'),
            const SizedBox(height: 20,),
            inputText("Fullname", _fullName),
            const SizedBox(height: 10,),
            inputText("Email", _email),
            const SizedBox(height: 10,),
            numinput("Total Room", _ttlRoom),
            const SizedBox(height: 10,),
            numinput("Total Night", _ttlNight),
            const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Payment(fullname: _fullName.text, email: _email.text, ttlnight: int.parse(_ttlNight.text), ttlroom: int.parse(_ttlRoom.text)),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                  ),
                  child: const Text(
                    'Buy',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
          ],
        ),
      ),
    );
  }
  Widget inputText(String label, TextEditingController controller){
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.grey)
        ),
      ),
    );
  }

  Widget numinput(String label, TextEditingController controller){
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: const BorderSide(color: Colors.grey)
        ),
      ),
    );
  }
}