struct S1 {
    a: Int = 1;
    b: Bool?;
}

struct S2 {
    x: S1;
    y: S1?;
}

contract TestContract {
    s2: S2;

    init() {
        self.s2 = S2 {
            x: S1{ a: 2, b: null },
            y: null
        };
    }
}