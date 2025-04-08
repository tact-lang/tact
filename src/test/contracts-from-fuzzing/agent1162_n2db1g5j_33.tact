struct WeirdOptional {
  intopt: Int?;
  boolopt: Bool?;
  stringopt: String?;
  cellopt: Cell?;
}
contract OptionalStruct {
  w: WeirdOptional;

  init() {
    self.w = WeirdOptional{
      intopt: null,
      boolopt: null,
      stringopt: null,
      cellopt: null,
    };
  }
}