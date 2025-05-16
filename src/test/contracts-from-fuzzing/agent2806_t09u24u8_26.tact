contract OptDefaultMix {
  a: Int? = null;
  b: Bool?;
  c: String? = "x";

  init() {
    self.a = null;
    self.b = true;
    self.c = null;
  }
}