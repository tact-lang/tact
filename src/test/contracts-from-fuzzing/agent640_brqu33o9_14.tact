struct A { val: Int; }
struct B { val: A; }
struct C { val: B; }
struct D { val: C; }
struct E { val: D; }

contract DeepDeep {
  data: E;
  init() { self.data = E{ val: D{ val: C{ val: B{ val: A{ val: 42 } } } } } ; }
}