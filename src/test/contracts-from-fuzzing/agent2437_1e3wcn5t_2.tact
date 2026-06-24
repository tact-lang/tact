struct Inner {
  x: Int;
  y: Bool?;
}

struct Outer {
  s: Inner;
  z: String?;
}

contract NestedContract {
  data: Outer;

  init() {
    self.data = Outer{
      s: Inner{
        x: 10,
        y: true,
      },
      z: "hello",
    };
  }
}