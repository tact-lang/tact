// Now test nested struct with some optionals assigned with values
struct InnerOpt {
  a: Int?;
  b: Bool?;
}

struct OuterOptVal {
  inner: InnerOpt;
  x: Int;
}

contract SetOptVal {
  val: OuterOptVal;
  init() {
    self.val = OuterOptVal {
      inner: InnerOpt { a: 7, b: true },
      x: 42
    };
  }
}