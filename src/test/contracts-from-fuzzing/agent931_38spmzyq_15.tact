struct A { f: Int; }
struct B { f: Int; }
struct C { f: Int; }
struct D { f: Int; }

struct BigUnion {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract NestedUnionTest {
    u: BigUnion;

    init() {
        self.u = BigUnion{
            a: A{f:1},
            b: B{f:2},
            c: C{f:3},
            d: D{f:4}
        };
    }
}