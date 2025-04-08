struct A { val: Int }
struct B { a: A }
struct C { b: B }

contract NoInitDeep {
  s: C;

  init() {
    self.s = C{ b: B{ a: A{ val: 5 } } };
  }
}
