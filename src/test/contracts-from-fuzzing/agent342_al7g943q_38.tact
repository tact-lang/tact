struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
}

contract TwoStructsFields {
    x: S1;
    y: S2;

    init() {
        self.x = S1{ a: 5 };
        self.y = S2{ b: 10 };
    }
}
