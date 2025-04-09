struct Wrap1 { a: Int }
struct Wrap2 { w1: Wrap1 }
contract NestedInits {
  f1: Wrap1;
  f2: Wrap2;

  init(){
    self.f1 = Wrap1{a:1};
    self.f2 = Wrap2{w1: Wrap1{a:2}};
  }
}