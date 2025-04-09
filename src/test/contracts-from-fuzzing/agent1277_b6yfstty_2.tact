struct Nested {
  foo: Int;
  bar: Bool?;
}

struct Top {
  n: Nested;
  flag: Bool;
}

contract TestContract {
  t: Top;
  init() {
    self.t = Top{n: Nested{foo: 5, bar: null}, flag: true};
  }
}