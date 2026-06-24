struct DeepPrimitives {
  small: Int as uint8;
  big: Int as int64;
  coin: Int as coins;
}

struct Wrapper1 {
  d1: DeepPrimitives;
}

struct Wrapper2 {
  d2: Wrapper1;
}

contract SerializeNest {
  deep: Wrapper2;

  init() {
    self.deep = Wrapper2{
      d2: Wrapper1{
        d1: DeepPrimitives{ small: 7, big: 1234567890, coin: ton("1") }
      }
    };
  }
}
