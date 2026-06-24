struct SerialNested {
  a: Int as uint8;
  b: Int as int16;
}

contract SerialContract {
  data: SerialNested;

  init() {
    self.data = SerialNested{ a:1, b:2 };
  }
}
