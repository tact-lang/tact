struct DeepNested {
    innermost: Int?;
}

struct MiddleNested {
    nested: DeepNested?;
}

struct OuterNested {
    mid: MiddleNested?;
}

contract ComplexPersistent {
    nestedData: OuterNested?;
    init() {
        self.nestedData = null;
    }
}