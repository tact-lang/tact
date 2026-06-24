contract NestedOptionalFields {
    optStruct: NestedOpt?;

    init() {
        self.optStruct = null;
    }
}

struct NestedOpt {
    innerOpt: InnerMost?;
}

struct InnerMost {
    val: Int;
}