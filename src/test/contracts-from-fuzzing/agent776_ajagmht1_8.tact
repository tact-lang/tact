struct S1 {
    a: Int;
}

struct S2 {
    b: Bool;
}

contract MultiStructs {
    x: S1;
    y: S2;
    init() {
        self.x = S1{ a: 7 };
        self.y = S2{ b: false };
    }
}