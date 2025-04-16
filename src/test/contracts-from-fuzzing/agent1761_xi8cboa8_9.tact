struct ManyInts {
  a1: Int;
  a2: Int;
  a3: Int;
  a4: Int;
  a5: Int;
  a6: Int;
  a7: Int;
  a8: Int;
  a9: Int;
  a10: Int;
}

contract ManyIntsTest {
  s: ManyInts;

  init() {
    self.s = ManyInts{
      a1:1,a2:1,a3:1,a4:1,a5:1,a6:1,a7:1,a8:1,a9:1,a10:1
    };
  }
}