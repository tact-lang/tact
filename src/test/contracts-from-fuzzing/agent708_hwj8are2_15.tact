struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

contract MultiStructs {
    one: S1;
    two: S2;

    init() {
        self.one = S1{ x: 1 };
        self.two = S2{ y: 2 };
    }
}