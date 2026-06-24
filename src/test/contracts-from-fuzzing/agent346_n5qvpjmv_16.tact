struct ComplexOptional {
    val: Int?;
    nested: NestedValues?;
}

struct NestedValues {
    flag: Bool;
    data: Int;
}

contract OptionalStruct {
    state: ComplexOptional;

    init() {
        self.state = ComplexOptional{
            val: null,
            nested: null
        };
    }
}