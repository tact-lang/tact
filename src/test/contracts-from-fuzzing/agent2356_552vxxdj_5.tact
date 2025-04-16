struct S1 {
    a: Int;
    b: String;
}

struct S2 {
    x: Bool;
    y: S1;
    z: String?;
}

contract MixedNestedStorage {
    s2field: S2;

    init() {
        self.s2field = S2{ x: false, y: S1{ a: 5, b: "hello" }, z: null };
    }
}