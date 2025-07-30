struct DeepNestedOpt {
    middle: MiddleOpt?;
}

struct MiddleOpt {
    val: Int?;
}

contract DeepOptInStruct {
    v: DeepNestedOpt;

    init() {
        self.v = DeepNestedOpt{middle: null};
    }
}