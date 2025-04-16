struct DeepOpt {
    innerOpt: ComplexInner?;
}

contract NestedOptional {
    field: DeepOpt;

    init() {
        self.field = DeepOpt{ innerOpt: null };
    }
}

struct ComplexInner {
    i: Int;
    flag: Bool;
    txt: String;
}