struct BoolInts {
  flag: Bool;
  num: Int;
}

struct Container {
  a: BoolInts;
  b: BoolInts;
  c: BoolInts;
}

contract ManyStructsTest {
  data: Container;

  init() {
    self.data = Container{
      a: BoolInts{ flag: true, num: 1 },
      b: BoolInts{ flag: false, num: 2 },
      c: BoolInts{ flag: true, num: 3 }
    };
  }
}
