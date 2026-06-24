struct S1 {
    a: Int;
}

struct S2 {
    b: S1?;
}

contract OptionalNestedField {
    data: S2;
    init() {
        self.data = S2{ b: null };
    }
}