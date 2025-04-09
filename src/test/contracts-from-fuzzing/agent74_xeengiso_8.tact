struct DoubleNested {
  a: Int;
  inner1: Inner;
  inner2: Inner;
}

struct Inner {
  deep: Deep;
  flag: Bool;
}

struct Deep {
  value: Int;
}

contract TestContract {
  data: DoubleNested;
  init() {
    self.data = DoubleNested{
      a: 1,
      inner1: Inner{ deep: Deep{ value: 2 }, flag: true },
      inner2: Inner{ deep: Deep{ value: 3 }, flag: false },
    };
  }
}