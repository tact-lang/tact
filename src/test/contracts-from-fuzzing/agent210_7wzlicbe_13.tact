struct A { x: Int; }
struct B { y: Bool; }
struct C { z: A; }
struct D { w: B; }

struct E {
    sA: A;
    sB: B;
    sC: C;
    sD: D;
}

contract DeepWide {
    e: E;

    init() {
        self.e = E{
            sA: A{x: 1},
            sB: B{y: false},
            sC: C{z: A{x: 2}},
            sD: D{w: B{y: true}}
        };
    }
}