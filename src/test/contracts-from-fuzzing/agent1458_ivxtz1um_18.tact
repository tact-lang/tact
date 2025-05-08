struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

contract ManyNestedStructFields {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ x: 10 };
        self.b = B{ y: 20 };
        self.c = C{ z: 30 };
    }
}