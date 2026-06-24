struct S1 {
  x1: Int?;
  x2: Int?;
}

struct S2 {
  s1o: S1?;
}

contract OptNestedStruct {
  val: S2;

  init() {
    self.val = S2{
      s1o: null
    };
  }
}