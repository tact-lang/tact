struct Inner {
  x: Int;
  y: Int;
}

struct OuterOption {
  inner: Inner?;
}

contract OptStructTop {
  field: OuterOption;

  init() {
    self.field = OuterOption{
      inner: null
    };
  }
}