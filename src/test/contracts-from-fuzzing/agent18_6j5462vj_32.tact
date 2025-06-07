struct Combo {
  a: Int;
  b: Int?;
  c: String;
  d: String?;
}

contract ComboTest {
  data: Combo;

  init() {
    self.data = Combo{ a:1, b:null, c:"x", d:null };
  }
}