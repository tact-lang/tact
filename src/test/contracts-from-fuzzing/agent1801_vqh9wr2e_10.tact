struct Deeply {
  s: String;
  inner: Int?;
}

struct Container {
  x: Bool;
  d: Deeply;
}

contract ContainerContract {
  val: Container;

  init() {
    self.val = Container{
      x: true,
      d: Deeply{
        s: "deep",
        inner: null,
      }
    };
  }
}