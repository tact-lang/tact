struct NestedOptional {
    optInner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalNestedStructField {
    field: NestedOptional;

    init() {
        self.field = NestedOptional{
            optInner: InnerStruct{ a: 42, b: true }
        };
    }
}