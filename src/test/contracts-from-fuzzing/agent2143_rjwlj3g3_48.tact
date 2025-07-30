struct OutOfOrder {
  flag: Bool;
  val: Int;
}

contract OutOfOrderStructStorage {
  a: Int;
  b: OutOfOrder;
  c: Bool;

  init() {
    self.a = 1;
    self.b = OutOfOrder{flag: true, val: 2};
    self.c = false;
  }
}