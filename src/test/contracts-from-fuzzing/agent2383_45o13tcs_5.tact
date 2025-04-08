struct NestedOptional {
    innerOpt: InnerOpt?;
}

struct InnerOpt {
    val: Int;
}

contract OptNest {
    state: NestedOptional;
    init() {
        self.state = NestedOptional{ innerOpt: InnerOpt{ val: 99 } };
    }
}