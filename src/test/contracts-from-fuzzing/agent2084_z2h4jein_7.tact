struct Inner {
  opt: Int?;
}

struct Container {
  inner: Inner?;
  word: String;
}

contract Foo {
  data: Container;

  init() {
    self.data = Container{
      inner: null,
      word: "test"
    };
  }
}
