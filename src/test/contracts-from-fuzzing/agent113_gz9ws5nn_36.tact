struct SerTest {
  a: Int as uint32;
  b: Int as int8;
  c: Int as uint1;
}

contract TestSerialization {
  s: SerTest;

  init() {
    self.s = SerTest{a:1,b:2,c:1};
  }
}