struct DeeplyOptional {
    inner: InnerStruct?;
}

struct InnerStruct {
    x: Int;
    y: Int?;
}

contract OptionalInOptional {
    field: DeeplyOptional?;

    init() {
        self.field = null;
    }
}