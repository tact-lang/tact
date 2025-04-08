struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct NestAB {
    a: A;
    b: B;
}

struct NestABC {
    ab: NestAB;
    c: C;
}

contract NestedStructsComplex {
    val: NestABC;

    init() {
        self.val = NestABC{
            ab: NestAB{
                a: A{a: 1},
                b: B{b: 2},
            },
            c: C{c: 3},
        };
    }
}