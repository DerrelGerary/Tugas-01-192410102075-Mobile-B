import 'package:contact_list/models/contact.dart';
import 'package:flutter/material.dart';

class AddContactScreen extends StatefulWidget {
  const AddContactScreen({Key? key}) : super(key: key);

  @override
  _AddContactScreenState createState() => _AddContactScreenState();
}

class _AddContactScreenState extends State<AddContactScreen> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah Kontak'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (String? e) {
                    if (e == null) {
                      return 'Url gambar tidak boleh kosong';
                    }
                  },
                  controller: _imageUrlController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "Url Gambar",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  validator: (String? e) {
                    if (e == null) {
                      return 'Nama tidal boleh kosong';
                    }
                  },
                  controller: _nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "Nama",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  validator: (String? e) {
                    if (e == null) {
                      return 'email tidal boleh kosong';
                    }
                  },
                  controller: _emailController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "Email",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                SizedBox(height: 18),
                TextFormField(
                  validator: (String? e) {
                    if (e == null) {
                      return 'nomor telepon tidal boleh kosong';
                    }
                  },
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(14),
                    labelText: "Nomor Telepon",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0),
                      borderSide: BorderSide(),
                    ),
                    //fillColor: Colors.green
                  ),
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: ElevatedButton(
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_formKey.currentState!.validate()) {
                            final Contact _results = Contact(
                              imageUrl: _imageUrlController.text,
                              name: _nameController.text,
                              email: _emailController.text,
                              phoneNumber: _phoneNumberController.text,
                            );

                            Navigator.of(context).pop(_results);
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          child: Text('Tambah'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
