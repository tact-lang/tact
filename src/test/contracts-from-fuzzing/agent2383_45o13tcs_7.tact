struct A { b: B; }
struct B { c: C; }
struct C { d: D; }
struct D { e: E; }
struct E { value: Int; }

contract UltraDeep {
    nested: A;
    init() {
        self.nested = A{ b: B{ c: C{ d: D{ e: E{ value: 8 } } } } };
    }
}