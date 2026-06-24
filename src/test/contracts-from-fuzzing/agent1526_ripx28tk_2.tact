struct DeepNested {
    inner: InnerStruct;
    flag: Bool;
}

struct InnerStruct {
    foo: Int;
    optField: String?;
}

contract DeepNestedContract {
    field: DeepNested;

    init() {
        self.field = DeepNested{
            inner: InnerStruct{
                foo: 42,
                optField: null,
            },
            flag: false,
        };
    }
}