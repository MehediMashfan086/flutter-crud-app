import 'package:c_r_u_d/contactModel.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ContactModel> contactList = [
    ContactModel(name: "Mehedi Hasan", number: "+8801686667110"),
    ContactModel(name: "Saif Hasan", number: "+8801681117110"),
    ContactModel(name: "Abir Hasan", number: "+8801682227110"),
  ];

  void addContactList(String inputName, String inputNumber) {
    var contact = ContactModel(
      name: inputName,
      number: inputNumber,
    );
    setState(() {
      contactList.add(contact);
    });
    print("New Contact Added Sucessfully!");
  }

  void deleteContact(String inputNumber) {
    setState(() {
      contactList.removeWhere((e) => e.number == inputNumber);
    });
    print("Number Deleted Successfully!");
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController inputName = TextEditingController();
    TextEditingController inputNumber = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: inputName,
              decoration: const InputDecoration(
                hintText: "Full Name",
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: inputNumber,
              decoration: const InputDecoration(
                hintText: "Mobile Number",
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print(inputName.text);
                print(inputNumber.text);
                addContactList(
                  inputName.text,
                  inputNumber.text,
                );
              },
              child: const Text("SAVE CONTACT"),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [Text("All Contacts List")],
            ),
            const SizedBox(
              height: 10,
            ),
            contactList.length == 0
                ? Center(
                    child: Text(
                      "Empty Contact",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: contactList
                            .map(
                              (e) => Container(
                                margin: const EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.deepPurple.shade100,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Icon(Icons.phone),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          e.name!.toString(),
                                          style: const TextStyle(
                                            fontSize: 15,
                                          ),
                                        ),
                                        Text(
                                          e.number!.toString(),
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                      onPressed: () {
                                        deleteContact(e.number!);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
