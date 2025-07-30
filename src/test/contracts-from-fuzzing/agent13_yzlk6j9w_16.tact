struct A { x: Int; }

struct B1 { a: A; }
struct B2 { a: A; }
struct B3 { a: A; }

contract ManyStructs {
    b1: B1;
    b2: B2;
    b3: B3;

    init() {
        self.b1 = B1{ a: A{ x: 1 } };
        self.b2 = B2{ a: A{ x: 2 } };
        self.b3 = B3{ a: A{ x: 3 } };
    }
}