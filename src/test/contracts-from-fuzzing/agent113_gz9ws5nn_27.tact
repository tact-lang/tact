struct BoolStrings {
  a: Bool;
  b: String;
  c: Bool;
  d: String;
}

contract BoolStrContract {
  bs: BoolStrings;

  init() {
    self.bs = BoolStrings{ a:true, b:"hi", c:false, d:"bye" };
  }
}