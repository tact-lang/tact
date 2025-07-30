struct Inner {
  x: Int;
  y: Int?;
}

struct Outer {
  inner: Inner;
  z: Bool;
}

contract StorageTest {
  data: Outer;

  init() {
    self.data = Outer{
      inner: Inner{
        x: 1,
        y: null,
      },
      z: true
    };
  }
}