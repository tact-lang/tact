struct RecA {
  val: Int;
}

struct RecB {
  a: RecA;
}

struct RecC {
  b: RecB;
}

contract ChainStruct {
  rec: RecC;

  init() {
    self.rec = RecC{ b: RecB{ a: RecA{ val: 7 }}};
  }
}