struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: A }
struct E { e: B }
struct F { f: C }

contract MultiNested {
    d: D;
    e: E;
    f: F;

    init() {
        self.d = D{ d: A{ a: 1 } };
        self.e = E{ e: B{ b: 2 } };
        self.f = F{ f: C{ c: 3 } };
    }
}