struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct ManyNested {
    a: A;
    b: B;
    c: C;
}

contract MultiWrap {
    n: ManyNested;

    init() {
        self.n = ManyNested{
            a: A{x:1},
            b: B{y:2},
            c: C{z:3}
        };
    }
}