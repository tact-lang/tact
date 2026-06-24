struct OptionalStructField {
  nested: SimpleNested?;
}

struct SimpleNested {
  x: Int;
  y: Int;
}

contract TestContract {
  val: OptionalStructField;

  init() {
    self.val = OptionalStructField{
      nested: null
    };
  }
}