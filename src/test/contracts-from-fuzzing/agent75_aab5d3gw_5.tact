struct DeepInner {
  active: Bool;
  count: Int;
}

struct Inner {
  label: String;
  extra: DeepInner;
}

struct Container {
  inner: Inner;
  optionalText: String?;
}

contract Test {
  container: Container;

  init() {
    self.container = Container{
      inner: Inner{ label: "hi", extra: DeepInner{ active: true, count: 7 } },
      optionalText: null
    };
  }
}