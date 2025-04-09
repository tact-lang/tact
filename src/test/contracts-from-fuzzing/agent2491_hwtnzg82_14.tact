struct A { val: Int; }
struct B { val: A; }
struct C { val: B; }

contract ChainNested {
  data: C;

  init() {
    self.data = C{val: B{val: A{val: 1}}};
  }
}