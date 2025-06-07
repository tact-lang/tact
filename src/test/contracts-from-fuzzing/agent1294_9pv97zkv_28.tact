struct InnerSet {
  a: Int = 100;
  b: Bool?;
}

struct Container {
  inner: InnerSet;
}

contract InitOverridesNested {
  field: Container;

  init() {
    self.field = Container{
      inner: InnerSet{
        a: 9999,
        b: true
      }
    };
  }
}