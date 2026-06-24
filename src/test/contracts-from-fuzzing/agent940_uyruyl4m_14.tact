struct S1 {
  f1: Int;
  f2: Int;
}

struct S2 {
  f1: Int;
  nested: S1;
}

contract SameFieldNamesNested {
  val: S2;

  init() {
    self.val = S2{
      f1: 11,
      nested: S1{ f1:1, f2:2 }
    };
  }
}
