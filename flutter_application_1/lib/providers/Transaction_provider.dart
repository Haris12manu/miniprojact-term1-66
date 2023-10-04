import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/database/Transaction_db.dart';
import 'package:flutter_application_1/model/Transactions.dart';

class TransactionProvider with ChangeNotifier {
  List<Transactions> transactions = [
    // Transaction(title: "หนงสือ", amount: 5000, date: DateTime.now()),
    // Transaction(title: "กางเกง", amount: 5000, date: DateTime.now())
  ];

  List<Transactions> getTransaction() {
    return transactions;
  }

  void addTransaction(Transactions statement) async {
    var db = TransactionDB(dbname: "transactions.db");

    //save data
    await db.insertData(statement);

    //pull data then select
    await db.loadAllData();

    transactions.insert(0, statement);
    //save data

    //alert consumer
    notifyListeners();
  }
}
