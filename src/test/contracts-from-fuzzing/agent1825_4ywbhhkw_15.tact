struct InnerMost {
    val: Int;
}

struct InnerOpt {
    inside: InnerMost?;
}

contract NestedEmptyOpt {
    opt: InnerOpt;

    init() {
        self.opt = InnerOpt{ inside: null };
    }
}
