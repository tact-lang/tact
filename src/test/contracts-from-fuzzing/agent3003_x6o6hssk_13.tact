struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract NestedMix {
    data: Combo;

    init() {
        self.data = Combo{
            a: A{ x: 123 },
            b: B{ y: false },
            c: C{ z: "ok" }
        };
    }
}
