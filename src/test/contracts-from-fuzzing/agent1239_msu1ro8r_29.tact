struct Combo {
  i: Int;
  s: String;
  b: Bool;
}

contract ComboContract {
  f1: Combo;
  f2: Combo?;

  init() {
    self.f1 = Combo{i:1,s:"one",b:true};
    self.f2 = null;
  }
}