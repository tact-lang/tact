struct NestedOptionalStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    flag: Bool;
}

contract OptionalStructField {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{
            inner: null,
        };
    }
}
