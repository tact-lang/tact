struct NestOne {
  a: Int;
}

struct NestTwo {
  b: NestOne;
}

struct NestThree {
  c: NestTwo;
}

contract MultiLayerContract {
  dat: NestThree;
  init() {
    self.dat = NestThree{ c: NestTwo{ b: NestOne{ a: 123 } } };
  }
}