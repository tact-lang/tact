struct A { x: Int; }
struct B { y: Bool; }
struct C { z: String; }
struct D { a: A; b: B; c: C; }

contract TestContract {
    bundled: D;

    init() {
        self.bundled = D{
            a: A{ x: 1 },
            b: B{ y: false },
            c: C{ z: "str" }
        };
    }
}