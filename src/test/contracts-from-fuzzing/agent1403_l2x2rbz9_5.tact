struct NestedOptStruct {
    inner1: Int?;
    inner2: Bool?;
}

struct WrapOpt {
    innerOpt: NestedOptStruct?;
}

contract ComplexOptional {
    optionalField: WrapOpt;

    init() {
        self.optionalField = WrapOpt {
            innerOpt: null
        };
    }
}