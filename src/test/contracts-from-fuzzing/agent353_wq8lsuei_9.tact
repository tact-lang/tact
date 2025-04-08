struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }

struct Combined {
    a: A;
    b: B;
    c: C;
}

contract TestContract {
    combined: Combined;

    init() {
        self.combined = Combined{
            a: A{ x: 1 },
            b: B{ y: true },
            c: C{ z: "str" },
        };
    }
}