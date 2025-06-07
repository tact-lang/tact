struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

contract MultiNested {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ x:1 };
        self.b = B{ y:2 };
        self.c = C{ z:3 };
    }
}