struct Inner {
  a: Int;
  b: Int;
  c: Bool;
}

struct Middle {
  x: Int;
  y: Bool;
  inner: Inner;
}

struct Outer {
  m: Middle;
  z: Int;
}

contract TestStorage {
  data: Outer;

  init() {
    self.data = Outer{
      m: Middle{
        x: 1,
        y: false,
        inner: Inner{a: 2, b: 3, c: true}
      },
      z: 77
    };
  }
}
