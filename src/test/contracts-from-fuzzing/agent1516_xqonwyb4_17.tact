struct Inner1 {
  f1: Int;
  f2: Bool;
}

struct Inner2 {
  s: String;
  b: Bool?;
}

struct Outer {
  in1: Inner1;
  in2: Inner2;
}

contract DoubleNesting {
  data: Outer;

  init() {
    self.data = Outer{
      in1: Inner1{ f1: 99, f2: false },
      in2: Inner2{ s: "hi", b: null }
    };
  }
}