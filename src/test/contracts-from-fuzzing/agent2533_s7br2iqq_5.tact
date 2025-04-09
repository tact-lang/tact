struct A { x: Int }
struct B { y: Int }
struct C { z: Int }
struct D { d: Int }

struct Combo {
    a: A;
    b: B;
    c: C;
    d: D;
}

contract Test {
    combo: Combo;

    init() {
        self.combo = Combo{
            a: A{ x: 1 },
            b: B{ y: 2 },
            c: C{ z: 3 },
            d: D{ d: 4 },
        };
    }
}