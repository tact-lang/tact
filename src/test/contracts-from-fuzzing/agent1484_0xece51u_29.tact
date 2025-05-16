struct OptionalDeep {
  lev1: Int?;
  lev2: Int?;
  lev3: Int?;
  lev4: Int?;
  lev5: Int?;
  lev6: Int?;
}

contract ManyOptionalNested {
  s: OptionalDeep?;

  init() {
    self.s = null;
  }
}