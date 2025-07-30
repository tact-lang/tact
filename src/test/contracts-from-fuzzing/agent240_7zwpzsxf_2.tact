struct S1 {
  x: Int;
  y: Bool;
}

struct S2 {
  s: S1;
  optInt: Int?;
  optBool: Bool?;
}

contract OptNested {
  data: S2;

  init() {
    self.data = S2{
      s: S1{ x: 5, y: true },
      optInt: null,
      optBool: false,
    };
  }
}
