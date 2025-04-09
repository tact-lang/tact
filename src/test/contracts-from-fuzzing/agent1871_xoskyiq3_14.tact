struct SerStruct {
  a: Int as uint128;
  b: Int as coins;
}

contract SerStructTest {
  data: SerStruct;

  init() {
    self.data = SerStruct{ a: 1, b: ton("2") };
  }
}