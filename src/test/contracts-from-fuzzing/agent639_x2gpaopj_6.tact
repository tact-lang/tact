struct OptionalNested {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract OptionalDeep {
    deep: OptionalNested;
    init() {
        self.deep = OptionalNested{ innerOpt: InnerOpt{ val: 7 } };
    }
}