struct DifferentOrders {
  boolVal: Bool;
  intVal: Int;
  strVal: String;
}

struct SwappedOrders {
  strVal: String;
  intVal: Int;
  boolVal: Bool;
}

contract TestStructOrder {
  a: DifferentOrders;
  b: SwappedOrders;

  init() {
    self.a = DifferentOrders{boolVal: true, intVal: 1, strVal: "one"};
    self.b = SwappedOrders{strVal: "two", intVal: 2, boolVal: false};
  }
}