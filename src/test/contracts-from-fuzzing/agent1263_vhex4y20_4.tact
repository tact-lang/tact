struct OptionalNested {
  foo: Int?;
  bar: Bool?;
}

contract TestContract {
  val: OptionalNested;

  init() {
    self.val = OptionalNested{
      foo: null,
      bar: true
    };
  }
}