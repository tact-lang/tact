// test contract with only optional string persistent field
contract OnlyOptionalString {
  name: String?;

  init() {
    self.name = null;
  }
}