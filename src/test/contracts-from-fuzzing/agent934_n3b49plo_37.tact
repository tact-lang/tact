struct Defaulted {
  a: Int = 1;
  b: Bool = true;
  c: String = "hi";
}

contract DefaultVals {
  d: Defaulted;
  init() {
    self.d = Defaulted{ a:2, b:false, c:"bye" };
  }
}