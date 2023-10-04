import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Transactions.dart';
import 'package:flutter_application_1/providers/Transaction_provider.dart';
import 'package:provider/provider.dart';

class FormScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 85, 197, 15),
      appBar: AppBar(
        title: Text("เเบบฟอร์มบันทึกข้อมูล"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: titleController, // Connect the controller
                decoration: InputDecoration(labelText: "รายการ"),
              ),
              TextFormField(
                controller: amountController, // Connect the controller
                decoration: InputDecoration(labelText: "ค่าใช้จ่าย"),
              ),
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.black),
                ),
                onPressed: () {
                  var title = titleController.text;
                  var amount = amountController.text;

                  // Check if amount is a valid double
                  if (double.tryParse(amount) != null) {
                    Transactions statement = Transactions(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now(),
                    );

                    var provider = Provider.of<TransactionProvider>(context,
                        listen: false);
                    provider.addTransaction(statement);
                    Navigator.pop(context);
                  } else {
                    // Handle the case where amount is not a valid double
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            "Invalid amount. Please enter a valid number."),
                      ),
                    );
                  }
                },
                child: Text("เพิ่มข้อมูล"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
