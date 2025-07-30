struct OptionalContainer {
  inside:Int?;
}

contract OptionPersist {
  field:OptionalContainer;
  init() {
    self.field=OptionalContainer{ inside:null };
  }
}