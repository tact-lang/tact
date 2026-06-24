struct DeepOptionalStruct {
    optionalInner: Inner?;
}

struct Inner {
    nestedOpt: Nested?;
}

struct Nested {
    final: Final?;
}

struct Final {
    num: Int;
}

contract OptionDeepNest {
    field: DeepOptionalStruct;
    init() {
        self.field = DeepOptionalStruct{
            optionalInner: null
        };
    }
}