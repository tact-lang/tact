contract Defaulted {
  a: Int = 5;
  b: Bool = false;
  s: String = "txt";
  opt: Int? = null;

  init() {
    self.a = 10;
    self.b = true;
    self.s = "change";
    self.opt = null;
  }
}