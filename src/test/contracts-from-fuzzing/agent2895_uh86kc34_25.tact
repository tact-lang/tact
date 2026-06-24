struct DeepOptionalStruct {
    val: Int?;
}

struct WrappingOptional {
    nested: DeepOptionalStruct?;
}

contract DeepOptionalWrap {
    nestedWrap: WrappingOptional?;

    init() {
        self.nestedWrap = null;
    }
}
