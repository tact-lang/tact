struct OptNested {
    foo: Int?;
    bar: Bool?;
    baz: String?;
}

struct Container {
    id: Int;
    sub: OptNested;
}

contract Test8 {
  val: Container;
  init() {
    self.val = Container{
      id: 42,
      sub: OptNested{
        foo: null,
        bar: null,
        baz: "Hi"
      }
    };
  }
}
