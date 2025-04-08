struct Nested {
  a: Int;
  b: Int?;
}

struct Complex {
  n: Nested;
  text: String;
  flag: Bool?;
}

contract TestContract {
  cmp: Complex;

  init() {
    self.cmp = Complex{
      n: Nested{ a: 10, b: null },
      text: "abc",
      flag: true,
    };
  }
}