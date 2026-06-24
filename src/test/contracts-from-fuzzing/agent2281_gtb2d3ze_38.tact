struct X {
  s: String?;
}

struct Y {
  x: X;
}

contract InnerHasNullableString {
  y: Y;

  init() {
    self.y = Y{ x: X{ s: null } };
  }
}