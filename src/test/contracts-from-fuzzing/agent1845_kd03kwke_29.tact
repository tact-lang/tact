// Subtly reorder fields in contract vs nested struct to test serialization
struct Ser {
  x: Int;
  y: Bool;
}

contract SerOrder {
  val: Ser;
  num: Int;
  flag: Bool;

  init() {
    self.val = Ser{ x: 1, y: true };
    self.num = 7;
    self.flag = false;
  }
}
