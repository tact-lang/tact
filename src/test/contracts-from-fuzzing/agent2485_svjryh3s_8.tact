struct DeepOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    num: Int?;
    boolVal: Bool?;
}

contract OptionalNestedStruct {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{ inner: null };
    }
}