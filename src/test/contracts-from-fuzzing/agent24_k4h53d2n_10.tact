struct StructWithOptionals {
    i: Int?;
    s: String?;
    nested: Inner?;
}

struct Inner {
    x: Int;
}

contract OptionalNestedVars {
    data: StructWithOptionals;

    init() {
        self.data = StructWithOptionals{
            i: null,
            s: null,
            nested: null,
        };
    }
}