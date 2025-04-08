struct BoolInt {
  b: Bool;
  i: Int as uint8;
}

contract Test {
  b1: BoolInt;
  b2: BoolInt;
  init() {
    self.b1 = BoolInt{ b:true, i: 10 };
    self.b2 = BoolInt{ b:false, i: 20 };
  }
}