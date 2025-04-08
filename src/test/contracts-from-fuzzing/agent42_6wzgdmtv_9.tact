struct Wrapped {
  field1: Int;
  optField: Inner?;
}

struct Inner {
  x: Int;
  y: Bool;
}

contract TestContract {
  storage: Wrapped;

  init() {
    self.storage = Wrapped{
      field1: 100,
      optField: Inner{ x: 5, y: true }
    };
  }
}