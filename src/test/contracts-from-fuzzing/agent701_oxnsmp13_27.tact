struct A { x: Int; }
struct B { y: Int; }

contract ManyStructs {
    a: A;
    b: B;
    c: Int;

    init() {
        self.a = A{ x: 1 };
        self.b = B{ y: 2 };
        self.c = 3;
    }
}