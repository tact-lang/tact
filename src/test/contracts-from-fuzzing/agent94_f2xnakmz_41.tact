struct SerOrder {
  a: Int as uint8;
  b: Int;
  c: Int as int128;
}

contract SerOrderTest {
  data: SerOrder;

  init() {
    self.data = SerOrder{
      a: 255,
      b: 42,
      c: -1000
    };
  }
}