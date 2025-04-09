struct InnerNested {
    x: Int;
}

struct OuterOpt {
    nested: InnerNested?;
}

contract OptionalNestedStruct {
    field: OuterOpt?;

    init() {
        self.field = null;
    }
}