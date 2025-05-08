struct A { x: Int }
struct B { y: String }
struct C { z: Bool }

struct Combo {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    combo: Combo;
    init() {
        self.combo = Combo{
            a: A{ x: 1 },
            b: B{ y: "hi" },
            c: C{ z: true }
        };
    }
}