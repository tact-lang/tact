struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }
struct F { f: Int; }

struct Complex {
    a: A;
    b: B?;
    c: C;
    d: D?;
    e: E;
    f: F?;
    flag: Bool;
}

contract Test {
    val: Complex = Complex{
        a: A{a:1},
        b: null,
        c: C{c:3},
        d: null,
        e: E{e:5},
        f: null,
        flag: true,
    };
}