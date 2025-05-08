struct ComboFields {
  intField: Int = 42;
  boolField: Bool = true;
  optInt: Int?;
  optBool: Bool?;
  strField: String = "hi";
}

contract TestContract {
  data: ComboFields;

  init() {
    self.data = ComboFields{
      optInt: null,
      optBool: null,
    };
  }
}