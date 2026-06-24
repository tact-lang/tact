struct OptStringBool {
  s: String?;
  b: Bool?;
}

contract Test {
  opt: OptStringBool;
  init() {
    self.opt = OptStringBool{ s:null, b:null };
  }
}