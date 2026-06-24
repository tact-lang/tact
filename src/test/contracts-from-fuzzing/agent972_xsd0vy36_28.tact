struct A { x: Int; }
struct B { y: Bool; }

contract ManyStructFields {
    s1: A;
    s2: B;
    s3: A;
    s4: B;

    init() {
        self.s1 = A{ x: 1 };
        self.s2 = B{ y: true };
        self.s3 = A{ x: 3 };
        self.s4 = B{ y: false };
    }
}