struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }

struct BigNested {
    a: A;
    b: B;
    c: C;
}

contract StructInsideStruct {
    big: BigNested = BigNested{
        a: A{a:1},
        b: B{b:2},
        c: C{c:3}
    };
}