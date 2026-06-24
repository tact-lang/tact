struct DeeplyNested {
    inner: InnerStruct;
}

struct InnerStruct {
    value: Bool;
}

contract DeepStructContract {
    field: DeeplyNested;

    init() {
        self.field = DeeplyNested{
            inner: InnerStruct{value: true}
        };
    }
}