struct Rec {
  x: Int;
  y: Bool;
  z: String;
}

contract OptionalStruct {
  opt: Rec?;

  init() {
    self.opt = null;
  }
}