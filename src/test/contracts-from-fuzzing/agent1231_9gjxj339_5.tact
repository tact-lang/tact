struct A { a1: Int; }
struct B { b1: A; }
struct C { c1: B; }
contract DeepNest {
    nested: C;
    init() {
        self.nested = C{ c1: B{ b1: A{ a1: 42 } } };
    }
}