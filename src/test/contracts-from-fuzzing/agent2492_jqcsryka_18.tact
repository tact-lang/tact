struct OptStr {
  a: Int?;
  b: Bool?;
}
contract NestedOptionalDefault {
  s: OptStr;
  init() {
    self.s = OptStr{a:null,b:null};
  }
}