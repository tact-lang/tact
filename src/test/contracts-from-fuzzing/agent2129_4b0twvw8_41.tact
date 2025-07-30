struct OptionNested {
  inner: Int?;
  note: String;
}

contract OptNestContract {
  field: OptionNested?;

  init() {
    self.field = null;
  }
}