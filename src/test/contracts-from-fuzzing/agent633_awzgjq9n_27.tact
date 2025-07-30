struct SerializeWeird {
  a: Int as int1;
  b: Int as uint1;
  c: Int as int257;
}

contract WeirdSerialization {
  data: SerializeWeird;

  init() {
    self.data = SerializeWeird{ a: 0, b: 1, c: 0 };
  }
}
