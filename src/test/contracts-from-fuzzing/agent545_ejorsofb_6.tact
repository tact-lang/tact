struct NestedOptionalStruct {
    val: Int?;
    nested: InnerStruct?;
}

struct InnerStruct {
    a: Int;
}

contract OptionalNestedStructStorage {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            val: 42,
            nested: InnerStruct{a: 5}
        };
    }
}