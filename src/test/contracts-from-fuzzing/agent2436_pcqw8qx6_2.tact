struct Inner {
  x: Int;
  y: Bool;
}

struct Outer {
  inner: Inner;
  s: String;
}

contract Sample {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{x: 1, y: true},
      s: "abc"
    };
  }
}