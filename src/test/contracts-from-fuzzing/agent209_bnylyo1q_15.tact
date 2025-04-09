struct OptionalNested {
  inner: Inner?;
}
struct Inner {
  nested: Nested?;
}
struct Nested {
  x: Int;
}

contract TestContract {
  data: OptionalNested;

  init() {
    self.data = OptionalNested{
      inner: null
    };
  }
}