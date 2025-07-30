struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Int?;
}

contract DeepNestedContract {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{ inner: InnerStruct{ value: 42 } };
    }
}