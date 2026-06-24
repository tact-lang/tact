struct SerOrder1 {
  a: Int as uint4;
  b: Int as uint8;
}

struct SerOrder2 {
  b: Int as uint8;
  a: Int as uint4;
}

contract SerializationOrderTest {
  storage1: SerOrder1;
  storage2: SerOrder2;

  init() {
    self.storage1 = SerOrder1{ a: 7, b: 255 };
    self.storage2 = SerOrder2{ b: 255, a: 7 };
  }
}