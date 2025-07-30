struct A { x: Int; }
struct B { y: Int; }
struct C { z: Int; }

contract ManyStructFields {
    s1: A;
    s2: B;
    s3: C;
    init() {
        self.s1 = A{ x:1 };
        self.s2 = B{ y:2 };
        self.s3 = C{ z:3 };
    }
}
