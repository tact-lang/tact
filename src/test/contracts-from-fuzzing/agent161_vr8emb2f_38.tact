// Contract with nested structs with deep optionals and some fields missing initialization

struct InnerMost {
    x: Int?;
    y: String;
}

struct Mid {
    inner: InnerMost?;
    count: Int;
}

contract PartialInitDeepOptional {
    foo: Mid;
    init() {
        self.foo = Mid{
            inner: null,
            count: 99,
        };
    }
}
