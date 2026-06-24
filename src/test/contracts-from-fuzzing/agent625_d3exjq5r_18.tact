struct DeepOpt {
    a: Int?;
    b: Nested?;
}

struct Nested {
    c: Int?;
    d: Bool?;
}

contract Test {
    field: DeepOpt;

    init() {
        self.field = DeepOpt {
            a: null,
            b: Nested { c: null, d: null }
        };
    }
}