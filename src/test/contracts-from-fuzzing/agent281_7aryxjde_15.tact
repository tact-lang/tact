struct A { a: Int; }
struct B { b: Int; }
struct C { c: Int; }
struct D { d: Int; }
struct E { e: Int; }

struct Bundle {
    a: A;
    b: B;
    c: C;
    d: D;
    e: E;
}

contract MultiBundle {
    x: Bundle;

    init() {
        self.x = Bundle{
            a: A{a:1},
            b: B{b:2},
            c: C{c:3},
            d: D{d:4},
            e: E{e:5}
        };
    }
}