struct A{a:Int}
struct B{b:A?}

contract TestContract {
  m:B;

  init() {
    self.m = B{b: null};
  }
}