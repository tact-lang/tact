// Compose optionals around deeply nested struct on leaf only
struct Inner {
  a: Int;
  b: Bool;
}
struct Container {
  child: Inner?;
}

contract OptionalDeepLeaf {
  s: Container;
  init() {
    self.s = Container{
      child: null
    };
  }
}
