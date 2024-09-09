import 'package:get/get.dart';
import 'package:hw_mvvm_2/Model/Item.dart';

class ItemController extends GetxController {
  var items = <Item>[
    Item(id: '1', name: 'Burger', price: 5.99),
    Item(id: '2', name: 'Pizza', price: 7.99),
    Item(id: '3', name: 'Pasta', price: 6.49),
  ].obs;

  RxInt totalItems = 0.obs;
  RxDouble totalCost = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    updateTotals();
  }

  void updateQuantity(String id, int newQuantity) {
    final item = items.firstWhereOrNull((item) => item.id == id);
    if (item != null) {
      item.quantity.value = newQuantity.clamp(0, double.infinity).toInt();
      updateTotals();
    }
  }

  void addItem(Item item) {
    items.add(item);
    updateTotals();
  }

  void removeItem(String id) {
    final item = items.firstWhereOrNull((item) => item.id == id);
    if (item != null) {
      items.remove(item);
      updateTotals();
    }
  }

  void addOrder() {
    List<Item> newItems = [
      Item(id: '4', name: 'Soda', price: 1.99, quantity: 1),
      Item(id: '5', name: 'Fries', price: 2.99, quantity: 2),
    ];

    items.addAll(newItems);
    updateTotals();

    String orderSummary = items.map((item) {
      return '${item.name}: ${item.quantity.value} x \$${item.price.toStringAsFixed(2)}';
    }).join('\n');
    Get.snackbar('Order Added', 'Order Details:\n$orderSummary');
  }

  void updateTotals() {
    totalItems.value = items.fold(0, (sum, item) => sum + item.quantity.value);
    totalCost.value =
        items.fold(0, (sum, item) => sum + item.price * item.quantity.value);
  }
}
