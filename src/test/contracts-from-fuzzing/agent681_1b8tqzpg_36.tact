struct Rec {
  f: Int;
}

contract WithOptRec {
  opt: Rec?;

  init() {
    self.opt = null;
  }
}