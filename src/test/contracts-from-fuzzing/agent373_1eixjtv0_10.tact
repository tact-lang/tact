struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    sub: S1;
}

contract MultiStructs {
    one: S1;
    two: S2;

    init() {
        self.one = S1{ x: 11 };
        self.two = S2{ y: 22, sub: self.one };
    }
}