import 'package:flutter/material.dart';
import 'package:project_4/data/global_data.dart';
import 'package:project_4/screens/NavigationBar/navigation_bar_widget.dart';
import 'package:project_4/widgets/custom_app_bar.dart';
import 'package:project_4/widgets/custom_button.dart';

import 'widgets/profile_text_field.dart';
import 'widgets/user_avatar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController(text: currentUser.name);
  TextEditingController phoneController = TextEditingController(text: currentUser.mobileNumber);
  TextEditingController emailController = TextEditingController(text: currentUser.email);
  TextEditingController passwordController = TextEditingController(text: currentUser.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      appBar: customAppBar(
          title: "My Profile",
          context: context,
          hasAction: false,
          onPressedFunc: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const BottomNavBar()));
          }),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .65,
          child: Column(
            children: [
              const SizedBox(height: 8),
              const Expanded(child: UserAvatar()),
              Expanded(
                flex: 5,
                child: Column(
                  children: [
                    ProfileTextField(
                        controller: nameController,
                        label: "Name",
                        isPassword: false,
                        inputType: TextInputType.text),
                    ProfileTextField(
                        controller: phoneController,
                        label: "Mobile Number",
                        isPassword: false,
                        inputType: TextInputType.number),
                    ProfileTextField(
                        controller: emailController,
                        label: "Email Address",
                        isPassword: false,
                        inputType: TextInputType.text),
                    ProfileTextField(
                        controller: passwordController,
                        label: "Password",
                        isPassword: true,
                        inputType: TextInputType.text),
                    CustomButton(
                        content: "Update",
                        hasIcon: false,
                        onPressedFunc: () {
                          checkUpdateInformation();
                        })
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void checkUpdateInformation() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        phoneController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please don't leave the field empty")));
    } else if (nameController.text != currentUser.name) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Name has been updated from [${currentUser.name}] to [${nameController.text}]")));
      currentUser.name = nameController.text;
    } else if (emailController.text != currentUser.email) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Email has been updated from [${currentUser.email}] to [${emailController.text}]")));
      currentUser.email = emailController.text;
    } else if (phoneController.text != currentUser.mobileNumber) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              "Phone Number has been updated from [${currentUser.mobileNumber}] to [${phoneController.text}]")));
      currentUser.mobileNumber = phoneController.text;
    } else if (passwordController.text != currentUser.password) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Password has been updated")));
      currentUser.password = passwordController.text;
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Your information is up-to-date")));
    }
  }
}
