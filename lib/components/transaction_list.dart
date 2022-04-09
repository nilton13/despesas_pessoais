import 'package:intl/intl.dart';
import 'package:despesas/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;
  final void Function(String) onRemove;

  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (ctx, index){
                final tr = transactions[index];
                 return Card(
                   elevation: 5,
                   margin: EdgeInsets.symmetric(
                     vertical: 8,
                     horizontal: 5,
                   ),
                   child: ListTile(
                     leading: CircleAvatar(
                       radius: 30,
                       child: Padding(
                         padding: const EdgeInsets.all(6.0),
                         child: FittedBox(
                           child: Text('R\$${tr.value}')
                           ),
                       ),
                     ),
                     title: Text(
                       tr.title,
                      ),
                      subtitle: Text(
                        DateFormat('d MMM y').format(tr.date),
                      ),
                      trailing: IconButton(
                        color: Colors.red,
                        icon: Icon(Icons.delete),
                        onPressed: () => onRemove(tr.id),                      
                      ),
                   ),
                 );
              }
            ),
    );
  }
}