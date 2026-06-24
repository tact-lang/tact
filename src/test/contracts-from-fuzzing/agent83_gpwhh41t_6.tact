struct NestedOptional {
    maybeInner: InnerStruct?;
}

struct InnerStruct {
    a: Int;
    b: Bool;
}

contract OptionalFields {
    data: NestedOptional;
    init() {
        self.data = NestedOptional{
            maybeInner: null
        };
    }
}