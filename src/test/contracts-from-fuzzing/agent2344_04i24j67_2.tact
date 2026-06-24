struct S { a: Int; b: Bool?; c: Int?; d: Bool; }

contract ManyOptionals {
  data: S;

  init() {
    self.data = S {
      a: 1,
      b: null,
      c: null,
      d: true,
    };
  }
}