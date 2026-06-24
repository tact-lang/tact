struct X {
  a: Int;
}
struct Y {
  x: X;
  b: Bool;
}
struct Z {
  y: Y;
  s: String;
}

contract MixedDeep {
  val: Z;

  init() {
    self.val = Z{
      y: Y{ x: X{a: 42}, b: false },
      s: "hello"
    };
  }
}
