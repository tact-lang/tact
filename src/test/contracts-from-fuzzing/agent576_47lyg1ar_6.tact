struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1_a: Int;
    s1_b: Bool;
}

// Intentionally flatten S1 into S2, then use both inside contract
contract TestContract {
    embedded: S1;
    flattened: S2;
    init() {
        self.embedded = S1{ a: 1, b: true };
        self.flattened = S2{ s1_a: 2, s1_b: false };
    }
}