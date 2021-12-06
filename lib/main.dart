import 'package:flutter/material.dart';
import 'package:flutter_stripe_payment/flutter_stripe_payment.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String publicKey ="pk_test_QQ6EqdeL67aoCecNqLETZVke00kNCuIBte";
  String secretKey ="sk_test_EIn7PcMgJCh005IxqH1Kmmn600n4wtSOKC";
  int prixProduitsUn=15;
  int prixProduitsDeux=50;
  int prixProduitsTrois=100;
  int prixProduitsQuatre=80;
  int prixProduitsCinqs=70;
  int quantiteprixProduitsUn=0;
  int qauntiteprixProduitsDeux=0;
  int quantiteprixProduitsTrois=0;
  int quantiteprixProduitsQuatre=0;
  int quantiteprixProduitsCinqs=0;
  var baseUrl = "https://api.stripe.com/v1/payment_intents";
  int total =0;
  final stripePaymentVariable = FlutterStripePayment();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stripePaymentVariable.setStripeSettings(publicKey);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('Paiement Stripe B3'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              Container(

                height: 70,

                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Produits 1'),
                      Text("$prixProduitsUn €"),

                      //Icon pour le bouton "-"

                      IconButton(
                          onPressed: (){
                        if(quantiteprixProduitsUn == 0){
                          setState(() {
                            quantiteprixProduitsUn =0;
                          });
                        }
                        else
                        {
                          setState(() {
                            quantiteprixProduitsUn --;
                          });
                        }
                        calcul();

                      },
                          icon: Icon(Icons.remove)
                      ),
                      Text("$quantiteprixProduitsUn"),
                      //Icon pour le bouton "+"
                      IconButton(onPressed: (){

                        setState(() {
                          quantiteprixProduitsUn ++;
                        });
                        calcul();


                      },
                          icon: Icon(Icons.add)
                      ),








                    ],

                  ),




                ),
              ),
              Container(

                height: 70,

                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Produits 2'),
                      Text("$prixProduitsDeux €"),

                      IconButton(onPressed: (){
                        if(qauntiteprixProduitsDeux == 0){
                          setState(() {
                            qauntiteprixProduitsDeux =0;
                          });
                        }
                        else
                        {
                          setState(() {
                            qauntiteprixProduitsDeux --;
                          });
                        }
                        calcul();


                      }, icon: Icon(Icons.remove)
                      ),
                      Text("$qauntiteprixProduitsDeux"),
                      IconButton(onPressed: (){

                        setState(() {
                          qauntiteprixProduitsDeux ++;
                        });
                        calcul();


                      },
                          icon: Icon(Icons.add)
                      ),








                    ],

                  ),




                ),
              ),

              Container(

                height: 70,


                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Produits 3'),
                      Text("$prixProduitsTrois €"),

                      IconButton(onPressed: (){
                        if(quantiteprixProduitsTrois == 0){
                          setState(() {
                            quantiteprixProduitsTrois =0;
                          });
                        }
                        else
                        {
                          setState(() {
                            quantiteprixProduitsTrois --;
                          });
                        }
                        calcul();

                      }, icon: Icon(Icons.remove)
                      ),
                      Text("$quantiteprixProduitsTrois"),
                      IconButton(onPressed: (){

                        setState(() {
                          quantiteprixProduitsTrois ++;
                        });
                        calcul();


                      },
                          icon: Icon(Icons.add)
                      ),








                    ],

                  ),




                ),
              ),
              Container(

                height: 70,

                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Produits 4'),
                      Text("$prixProduitsQuatre €"),

                      IconButton(onPressed: (){
                        if(quantiteprixProduitsQuatre == 0){
                          setState(() {
                            quantiteprixProduitsQuatre =0;
                          });
                        }
                        else
                        {
                          setState(() {
                            quantiteprixProduitsQuatre --;
                          });
                        }
                        calcul();

                      }, icon: Icon(Icons.remove)
                      ),
                      Text("$quantiteprixProduitsQuatre"),
                      IconButton(onPressed: (){

                        setState(() {
                          quantiteprixProduitsQuatre ++;
                        });
                        calcul();


                      },
                          icon: Icon(Icons.add)
                      ),








                    ],

                  ),




                ),
              ),
              Container(

                height: 70,

                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text('Produits 5'),
                      Text("$prixProduitsCinqs €"),

                      IconButton(onPressed: (){
                        if(quantiteprixProduitsCinqs == 0){
                          setState(() {
                            quantiteprixProduitsCinqs =0;
                          });
                        }
                        else
                        {
                          setState(() {
                            quantiteprixProduitsCinqs --;
                          });
                        }
                        calcul();

                      }, icon: Icon(Icons.remove)
                      ),
                      Text("$quantiteprixProduitsCinqs"),
                      IconButton(onPressed: (){

                        setState(() {
                          quantiteprixProduitsCinqs ++;
                        });
                        calcul();


                      },
                          icon: Icon(Icons.add)
                      ),








                    ],

                  ),




                ),
              ),




            ],
          ),



          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed:() async {
              calcul();
              PaymentResponse reponse = await stripePaymentVariable.addPaymentMethod();
              Map<String,String> headers ={
                'Authorization':'Bearer ${secretKey}',
                'Content-Type':'application/x-www-form-urlencoded',
              };


              int montant = total*100;

              Map<String,String> body ={
                "amount": "${montant}",
                "currency":"eur",
                "payment_method": reponse.paymentMethodId!
              };



              var url = "${baseUrl}?=${publicKey}";


              var response = await http.post(Uri.parse(url),headers: headers,body: body);



              var jsonReponse = convert.jsonDecode(response.body) as Map<String,dynamic>;
              var clientSecret = jsonReponse['client_secret'];
              var id = jsonReponse['id'];
              var urlConfirmation = "${baseUrl}/$id/confirm";
              var adresseFinal = await http.post(Uri.parse(urlConfirmation),headers: headers);
              },
                child: Text("Payer $total €")),
          ),




        ],
      )


    );
  }

  calcul(){
    setState(() {

      total = prixProduitsUn * quantiteprixProduitsUn + prixProduitsDeux * qauntiteprixProduitsDeux+ prixProduitsTrois *quantiteprixProduitsTrois + prixProduitsQuatre *quantiteprixProduitsQuatre + prixProduitsCinqs *quantiteprixProduitsCinqs;
    });
  }
}
