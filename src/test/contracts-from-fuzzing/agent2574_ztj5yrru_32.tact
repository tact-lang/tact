struct BoolInt {
  f1: Bool;
  f2: Int;
}

struct IntBool {
  f1: Int;
  f2: Bool;
}

contract WeirdOrder {
  b: BoolInt;
  i: IntBool;

  init() {
    self.b = BoolInt{ f1: true, f2: 1 };
    self.i = IntBool{ f1: 2, f2: false };
  }
}