struct NestedStruct {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int;
}

contract DeepOptionalField {
    data: NestedStruct?;

    init() {
        self.data = null;
    }
}