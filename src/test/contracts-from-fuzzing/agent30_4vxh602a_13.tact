struct SingleBoolOptional {
    opt: Bool?;
}

struct StructWithOptionalStruct {
    nestedOpt: SingleBoolOptional?;
}

contract ComplexOptional {
    s: StructWithOptionalStruct;
    init() {
        self.s = StructWithOptionalStruct{ nestedOpt: null };
    }
}