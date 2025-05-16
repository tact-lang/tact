struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

struct D {
    a: A;
    b: B;
    c: C;
}

contract DeepCompose {
    val: D;

    init() {
        self.val = D{
            a: A{ x: 7 },
            b: B{ y: 8 },
            c: C{ z: 9 }
        };
    }
}