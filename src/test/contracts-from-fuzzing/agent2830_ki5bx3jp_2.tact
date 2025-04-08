struct Nested1 {
  f1: Int;
  f2: Bool;
}

struct Nested2 {
  f3: Int?;
  f4: Nested1;
}

contract DeepCombo {
  s1: Nested1;
  s2: Nested2;

  init() {
    self.s1 = Nested1{f1:10, f2:false};
    self.s2 = Nested2{f3:null, f4: self.s1};
  }
}