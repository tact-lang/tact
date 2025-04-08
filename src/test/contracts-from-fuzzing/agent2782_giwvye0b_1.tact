struct Deep {
  x: Int;
  y: Int?;
}

struct Nested {
  inner: Deep?;
  flag: Bool;
}

contract Test {
  data: Nested;
  init() {
    self.data = Nested{inner: null, flag: true};
  }
}