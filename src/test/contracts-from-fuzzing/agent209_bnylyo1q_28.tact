struct DefaultMix {
  a: Int = 1;
  b: Bool;
  c: Int?;
  d: Bool? = null;
}

contract TestContract {
  val: DefaultMix;

  init() {
    self.val = DefaultMix{b:true, c:null};
  }
}