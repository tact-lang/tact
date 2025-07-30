// Edge case: optional struct with nested optional inside

struct Nested {
    x: Int?;
}

struct Wrap {
    inner: Nested?;
}

contract OptionalStructInOptional {
    data: Wrap?;

    init() {
        self.data = null;
    }
}
