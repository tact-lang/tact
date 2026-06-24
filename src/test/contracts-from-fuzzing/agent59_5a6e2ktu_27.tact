struct P1 {
    a: Int; b: Int;
}
struct P2 {
    a: Int; b: Int;
}
struct P3 {
    a: Int; b: Int;
}

contract ManyStructs {
    p1: P1;
    p2: P2;
    p3: P3;

    init() {
        self.p1 = P1{ a:1, b:2 };
        self.p2 = P2{ a:3, b:4 };
        self.p3 = P3{ a:5, b:6 };
    }
}