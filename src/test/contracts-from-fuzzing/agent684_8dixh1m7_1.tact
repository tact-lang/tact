struct DeepNested {
    sub: Nested;
}

struct Nested {
    subsub: InnerMost;
}

struct InnerMost {
    val: Int;
    opt: Bool?;
}

contract TestDeep {
    field: DeepNested;
    
    init() {
        self.field = DeepNested {
            sub: Nested {
                subsub: InnerMost {
                    val: 42,
                    opt: true,
                },
            },
        };
    }
}