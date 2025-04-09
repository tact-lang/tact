struct OptBool {
  b: Bool?;
}

contract OnlyOptBool {
  val: OptBool;

  init() {
    self.val = OptBool{b:null};
  }
}