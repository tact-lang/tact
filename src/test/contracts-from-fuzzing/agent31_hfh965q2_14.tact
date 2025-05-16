struct DefaultVals {
  a: Int = 10;
  b: String = "test";
  c: Bool = false;
  d: Int?;
}

contract Test {
  val: DefaultVals;
  
  init() {
    self.val = DefaultVals{
      d: null
    };
  }
}