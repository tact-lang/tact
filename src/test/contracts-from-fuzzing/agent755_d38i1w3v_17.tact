struct OutOfOrder {
  a: Int?;
  b: Int;
}

contract InitOrder {
  data: OutOfOrder;

  init() {
    self.data = OutOfOrder{a:null,b:3};
  }
}