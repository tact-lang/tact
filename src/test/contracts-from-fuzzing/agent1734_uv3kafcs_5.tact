struct S1 {
    a: Int?;
    b: Bool?;
    c: String?;
}

struct S2 {
    s: S1?;
    d: Int;
}

contract Test {
    store: S2;
    init() {
        self.store = S2{ s: null, d: 10 };
    }
}