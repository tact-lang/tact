struct DeepOptionalStruct {
    s: InnerOpt?;
}

struct InnerOpt {
    flag: Bool;
    num: Int;
}

contract OptionalNestedFields {
    data: DeepOptionalStruct;

    init() {
        self.data = DeepOptionalStruct{ s: null };
    }
}