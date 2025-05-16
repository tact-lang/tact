struct Inner {
  intField: Int;
  boolField: Bool;
  stringField: String;
}

contract TestContract {
  nestedField: Inner;

  init() {
    self.nestedField = Inner{
      intField: 1,
      boolField: true,
      stringField: "hello"
    };
  }
}