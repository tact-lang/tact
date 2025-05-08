struct A { f1: Int; }
struct B { a: A; }
struct C { b: B; }
struct D { c: C; }
struct E { d: D; }

contract VeryDeepNest {
    e: E;
    
    init() {
        self.e = E{ d: D{ c: C{ b: B{ a: A{ f1: 1 } } } } };
    }
}
