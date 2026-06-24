struct A { valA: Int; }
struct B { valB: Int; }
struct C { valC: Int; }
struct D { valD: Int; }

struct NestedStructs {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract MultiNested {
    data: NestedStructs = NestedStructs{
        a: A{ valA: 1 },
        b: B{ valB: 2 },
        c: C{ valC: 3 },
        d: D{ valD: 4 }
    };
}