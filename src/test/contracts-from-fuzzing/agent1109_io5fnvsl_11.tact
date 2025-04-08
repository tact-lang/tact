struct OptionalNested {
  innerOpt: Int?;
  text: String?;
}

contract NestedOptional {
  data: OptionalNested?;

  init() {
    self.data = null;
  }
}