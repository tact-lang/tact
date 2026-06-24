struct Sub1 {
  a: Int;
}
struct Sub2 {
  b: Int;
}

contract MultiNestedStructs {
  s1: Sub1;
  s2: Sub2;

  init() {
    self.s1 = Sub1{a: 1};
    self.s2 = Sub2{b: 2};
  }
}