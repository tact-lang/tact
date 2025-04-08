struct A {
  i: Int;
  b: Bool;
}

struct B {
  sa: A;
  s: String;
}

contract WideStruct {
  f: B;

  init() {
    self.f = B{sa: A{i:1,b:true}, s:"ok"};
  }
}