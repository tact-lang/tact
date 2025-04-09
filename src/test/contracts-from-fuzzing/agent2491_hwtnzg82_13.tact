struct SerializeWidths {
  a: Int as uint8;
  b: Int as int16;
  c: Int as uint4;
}

contract SerializeTest {
  val: SerializeWidths;

  init() {
    self.val = SerializeWidths{a:5,b:5,c:5};
  }
}