struct DoubleNested {
    inner1: Int;
    inner2: Bool?;
    nested: InnerLevel;
}

struct InnerLevel {
    testInt: Int;
    testBool: Bool;
}

contract DeepOptionalNesting {
    field: DoubleNested?;
    init() {
        self.field = null;
    }
}