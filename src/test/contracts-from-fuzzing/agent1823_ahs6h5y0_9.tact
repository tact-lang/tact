struct OptionalNested {
    inner: InnerStruct?;
}

struct InnerStruct {
    val: Int;
    flag: Bool;
}

contract OptNestedFields {
    field: OptionalNested;

    init() {
        self.field = OptionalNested{
            inner: InnerStruct{
                val: 42,
                flag: true
            }
        };
    }
}