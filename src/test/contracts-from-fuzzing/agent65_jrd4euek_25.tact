struct Outer {
  in1: Int;
  in2: Inner;
}

struct Inner {
  x: Int;
  s: String;
  flag: Bool;
}

contract ComplexComb {
  val: Outer;
  init() {
    self.val = Outer{
      in1: 77,
      in2: Inner{
        x: 42,
        s: "str",
        flag: true
      }
    };
  }
}