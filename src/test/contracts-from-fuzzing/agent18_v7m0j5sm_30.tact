struct A { val:Int; }
struct B { val:A; }
struct C { val:B; }
struct D { val:C; }
struct E { val:D; }

contract LongNest {
  v: E;

  init() {
    self.v = E{ val:D{ val:C{ val:B{ val:A{ val:1 } } } } };
  }
}