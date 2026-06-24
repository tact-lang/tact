struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }
struct D { w: Int; }

contract ManyStructFields {
    a: A;
    b: B;
    c: C;
    d: D;

    init() {
        self.a = A{ x:1 };
        self.b = B{ y:2 };
        self.c = C{ z:3 };
        self.d = D{ w:4 };
    }
}