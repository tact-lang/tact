struct A1 { a: Int }
struct A2 { b: Bool? }
struct A3 { s: String }

contract MixedStructs {
  f1: A1;
  f2: A2;
  f3: A3;
  
  init() {
    self.f1 = A1{a: 1};
    self.f2 = A2{b: null};
    self.f3 = A3{s: "qwe"};
  }
}