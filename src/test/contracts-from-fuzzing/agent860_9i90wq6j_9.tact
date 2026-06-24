struct Str1 {
  a: Int;
}

struct Str2 {
  b: Str1;
}

struct Str3 {
  c: Str2;
}

contract DeepChain {
  d: Str3;

  init() {
    self.d = Str3{c: Str2{b: Str1{a: 1}}};
  }
}