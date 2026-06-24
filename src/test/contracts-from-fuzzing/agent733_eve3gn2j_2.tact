struct Inner {
  a: Int;
  b: Bool;
  c: String;
}

struct Outer {
  x: Int;
  y: Inner;
  z: String?;
}

contract TestContract {
  data: Outer;

  init() {
    self.data = Outer{
      x: 1,
      y: Inner{
        a: 10,
        b: true,
        c: "str"
      },
      z: null
    };
  }
}