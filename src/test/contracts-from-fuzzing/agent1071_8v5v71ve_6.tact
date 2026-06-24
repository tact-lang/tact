struct A { a: Int = 1; }
struct B { b: Int = 2; }
struct C { c: Int = 3; }
struct D { d: Int = 4; }
struct E { e: Int = 5; }
struct F { f: Int = 6; }

struct Massive {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
    f: F;
}

contract Test7 {
    massive: Massive = Massive{
        a: A{a: 10},
        b: B{b: 20},
        c: C{c: 30},
        d: D{d: 40},
        e: E{e: 50},
        f: F{f: 60}
    };

    init() {
        self.massive = Massive{
            a: A{a:11},
            b: B{b:21},
            c: C{c:31},
            d: D{d:41},
            e: E{e:51},
            f: F{f:61}
        };
    }
}