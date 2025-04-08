struct BitsTest {
  f1: Int as uint4;
  f2: Int as uint7;
  f3: Int as uint5;
  f4: Int as uint16;
}

contract SerializerBits {
  val: BitsTest;

  init() {
    self.val = BitsTest{f1: 15, f2: 100, f3: 10, f4: 65535};
  }
}
