struct NestedStrOpt {
    label: String?;
    amt: Int;
}

contract MoreNesting {
    s1: NestedStrOpt?;
    s2: NestedStrOpt;

    init() {
        self.s1 = null;
        self.s2 = NestedStrOpt{label: "hi", amt: 7};
    }
}
