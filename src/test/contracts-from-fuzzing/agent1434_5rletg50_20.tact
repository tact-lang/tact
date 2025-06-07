struct Sub {
  a: Int;
  b: Bool;
}
contract NestedDirectly {
  subField: Sub;
  init() {
    self.subField = Sub{ a: 7, b: true };
  }
}