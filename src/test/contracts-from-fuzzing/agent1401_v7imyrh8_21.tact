struct ComboDefault {
  a: Int = 10;
  b: Bool;
  c: String = "hi";
}

contract ComboDefaultContract {
  s: ComboDefault;

  init() {
    self.s = ComboDefault{b:true};
  }
}