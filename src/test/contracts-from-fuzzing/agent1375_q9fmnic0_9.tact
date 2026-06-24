struct NestedOptionalStruct {
    innerOpt: StructInner?;
}

struct StructInner {
    value: Int;
}

contract NestedOptionalsContract {
    data: NestedOptionalStruct;

    init() {
        self.data = NestedOptionalStruct{ innerOpt: null };
    }
}