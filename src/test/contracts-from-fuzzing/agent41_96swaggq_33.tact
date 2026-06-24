contract DefaultsInContract {
  a: Int = 7;
  b: Bool = true;
  c: String = "hey";

  init() {
    self.a = 1;
    self.b = false;
    self.c = "no";
  }
}
