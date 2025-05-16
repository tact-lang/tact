// Nested struct with mix of optionals, defaults, serialization
struct S2 {
    foo: Int? = null;
    bar: String?;
}
struct S1 {
    s2: S2;
    x: Bool?;
}

contract MixedDeep {
    s1: S1;

    init() {
        self.s1 = S1{ s2: S2{ bar: null }, x: null };
    }
}
