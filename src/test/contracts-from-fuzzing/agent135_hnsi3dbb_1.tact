struct NestedOpt {
    innerOpt: Int?;
}

contract Test {
    s: NestedOpt;

    init() {
        self.s = NestedOpt{ innerOpt: null };
    }
}