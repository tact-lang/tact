struct Nested {
    a: Int;
    b: Bool;
}

struct Wrapper {
    payload: Nested;
}

contract OptionalNestedStructField {
    storage: Wrapper?;

    init() {
        self.storage = null;
    }
}