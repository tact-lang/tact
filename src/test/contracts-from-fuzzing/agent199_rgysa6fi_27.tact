struct Inner {
    val: Int?;
}

struct DeepOptional {
    nested: Inner?;
}

contract OptionalInnerStruct {
    data: DeepOptional;

    init() {
        self.data = DeepOptional{
            nested: null,
        };
    }
}
