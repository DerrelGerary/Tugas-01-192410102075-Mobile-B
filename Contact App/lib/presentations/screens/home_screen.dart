import 'package:contact_list/data.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/presentations/screens/add_contact_screen.dart';
import 'package:contact_list/presentations/widgets/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Contact> contacts = [];
  bool asc = false;

  @override
  void initState() {
    contacts.addAll(listContacts);
    super.initState();
  }

  void sortList() {
    setState(() {
      if (asc) {
        contacts.sort((a, b) => a.name.compareTo(b.name));
      } else {
        contacts.sort((b, a) => a.name.compareTo(b.name));
      }
    });
    asc = !asc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _floatingActionButton(context),
      appBar: AppBar(
        title: Text('My Contact'),
        actions: [
          IconButton(
            onPressed: () {
              sortList();
            },
            icon: Icon(Icons.swap_vert),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: contacts.isNotEmpty
            ? ListView.builder(
                padding: const EdgeInsets.only(
                  bottom: 18,
                  top: 12,
                ),
                shrinkWrap: true,
                itemCount: contacts.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    key: UniqueKey(),
                    actions: [
                      IconButton(
                        onPressed: () => _onDeleteContact(context, index),
                        icon: Icon(
                          Icons.delete,
                          color: Colors.grey[400],
                        ),
                        tooltip: 'Hapus',
                      ),
                    ],
                    actionPane: const SlidableDrawerActionPane(),
                    child: ContactItem(item: contacts[index]),
                  );
                },
              )
            : Center(
                child: Text('Tidak ada kontak'),
              ),
      ),
    );
  }

  Future<void> _onDeleteContact(BuildContext context, index) async {
    final results = await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: const Text(
            'Kamu yakin ingin manghapus kontak yang dipilih?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // passing false
              child: Text(
                'Batalkan',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, true), // passing true
              child: Text(
                'Lanjutkan',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );

    if (results == true) {
      setState(() {
        contacts.removeAt(index);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Berhasil menghapus'),
            backgroundColor: Colors.black45,
          ),
        );
      });
    }
  }

  FloatingActionButton _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {
        final results = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => const AddContactScreen(),
          ),
        );
        if (results != null) {
          setState(() {
            contacts.add(results);
          });
        }
      },
      child: const Icon(Icons.add),
    );
  }
}
