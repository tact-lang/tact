struct NestedOptionalContainer {
  maybeInt: Int?;
  maybeBool: Bool?;
  maybeStr: String?;
}

contract Test {
  optContainer: NestedOptionalContainer?;

  init() {
    self.optContainer = NestedOptionalContainer{
      maybeInt: null,
      maybeBool: false,
      maybeStr: "ok"
    };
  }
}