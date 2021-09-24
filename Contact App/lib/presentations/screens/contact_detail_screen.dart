import 'package:contact_list/config/custom_colors.dart';
import 'package:contact_list/models/contact.dart';
import 'package:contact_list/presentations/widgets/custom_rounded_image.dart';
import 'package:flutter/material.dart';

class ContactDetailScreen extends StatelessWidget {
  const ContactDetailScreen({
    Key? key,
    required this.contact,
  }) : super(key: key);

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.transparent,
        title: Text('Detail Contact'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            profilePhoto(),
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  actionItem(icon: Icons.message_rounded, title: 'Pesan'),
                  const SizedBox(width: 10),
                  actionItem(icon: Icons.call, title: 'Panggil'),
                  const SizedBox(width: 10),
                  actionItem(icon: Icons.videocam_rounded, title: 'Video'),
                ],
              ),
            ),
            const SizedBox(height: 18),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  informationItem(
                    icon: Icons.person_outline,
                    title: 'Nama',
                    value: contact.name,
                  ),
                  informationItem(
                    icon: Icons.phone_outlined,
                    title: 'Telepon',
                    value: contact.phoneNumber,
                  ),
                  informationItem(
                    icon: Icons.email_outlined,
                    title: 'Email',
                    value: contact.email,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded actionItem({required IconData icon, required String title}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Column(
          children: [
            Icon(icon, color: CustomColor.primary),
            Text(
              title,
              style: TextStyle(color: CustomColor.primary),
            ),
          ],
        ),
      ),
    );
  }

  Column profilePhoto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 32),
        SizedBox(
          height: 120,
          child: Hero(
            tag: contact.email,
            child: CustomRoundedImage(imageUrl: contact.imageUrl),
          ),
        ),
      ],
    );
  }

  Column informationItem(
      {required String title, required String value, required IconData icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: CustomColor.primary,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Divider(thickness: 0.8),
        ),
      ],
    );
  }
}
