struct V {
  a: Int?;
  b: Bool?;
}
contract NullInStruct {
  data: V;

  init() {
    self.data = V{ a:null, b:null };
  }
}