struct RecA {
  val: Int;
}

struct RecB {
  a: RecA;
}

struct RecC {
  b: RecB;
}

contract RecursiveStruct {
  data: RecC;

  init() {
    self.data = RecC{ b: RecB{ a: RecA{ val: 11 } } };
  }
}
