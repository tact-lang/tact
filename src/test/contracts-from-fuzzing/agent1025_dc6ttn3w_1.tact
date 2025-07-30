struct NestedField {
    fieldA: Int;
    inner: InnerStruct;
}

struct InnerStruct {
    fieldB: Bool;
    optField: String?;
}

contract TestContract {
    storage: NestedField;

    init() {
        self.storage = NestedField{
            fieldA: 123,
            inner: InnerStruct{
                fieldB: true,
                optField: null,
            },
        };
    }
}