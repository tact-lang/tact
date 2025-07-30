// Testing deeply nested optional struct in persistent contract field
struct Z {
  x: Int?;
}
struct Y {
  z: Z?;
}
struct X {
  y: Y?;
}

contract DeepOptionalStructField {
  s: X;

  init() {
    self.s = X{ y: Y{ z: Z{ x: 5 } } };
  }
}
