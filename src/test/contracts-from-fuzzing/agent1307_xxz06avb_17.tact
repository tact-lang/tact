struct InnerMost {
    foo: Int;
}

struct Mid1 {
    m1: InnerMost;
}

struct Mid2 {
    m2: Mid1;
}

struct Mid3 {
    m3: Mid2;
}

contract NestedCrazy {
    insane: Mid3 = Mid3{ m3: Mid2{ m2: Mid1{ m1: InnerMost{ foo: 0 } } } };

    init() {
        self.insane = Mid3{ m3: Mid2{ m2: Mid1{ m1: InnerMost{ foo: 123456 } } } };
    }
}