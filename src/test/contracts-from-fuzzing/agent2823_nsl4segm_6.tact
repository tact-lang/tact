struct S1 {
    a: Int?;
}

struct S2 {
    b: S1?;
}

contract OptionalNestedStructs {
    payload: S2?;

    init() {
        self.payload = S2{ b: S1{ a: 123 } };
    }
}