struct SerialOrder {
  v1: Int as uint4;
  v2: Int as uint8;
  v3: Int as uint12;
  v4: Int as uint16;
  v5: Int as uint20;
}

contract SerialOrderContract {
  data: SerialOrder;
  init() {
    self.data = SerialOrder{
      v1: 1,
      v2: 2,
      v3: 3,
      v4: 4,
      v5: 5
    };
  }
}