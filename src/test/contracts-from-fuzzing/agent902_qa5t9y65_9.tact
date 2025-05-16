struct A { a: Int }
struct B { b: Int }
struct C { c: Int }
struct D { d: Int }

struct ManyNested {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract NestedManyStructs {
    s: ManyNested;

    init() {
        self.s = ManyNested{
            a: A{ a: 1 },
            b: B{ b: 2 },
            c: C{ c: 3 },
            d: D{ d: 4 },
        };
    }
}