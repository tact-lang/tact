struct SDefault {
  a: Int = 0;
  b: Bool = false;
  c: String = "";
}

contract WithDefaults {
  s: SDefault;

  init() {
    self.s = SDefault{ a:42, b:true, c:"hi" };
  }
}
