struct Nested {
    inner: InnerOptional;
}

struct InnerOptional {
    value: Int?;
}

contract Test {
    data: Nested;

    init() {
        self.data = Nested{ inner: InnerOptional{ value: null } };
    }
}