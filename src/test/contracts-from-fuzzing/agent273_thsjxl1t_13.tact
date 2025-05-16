struct A { x: Int; }
struct B { y: String; }
struct C { z: Bool; }

contract Test13 {
    a: A;
    b: B;
    c: C;

    init() {
        self.a = A{ x: 11 };
        self.b = B{ y: "hey" };
        self.c = C{ z: false };
    }
}