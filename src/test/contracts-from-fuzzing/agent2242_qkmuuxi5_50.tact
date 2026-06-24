struct NestedOptWrap {
    inside: Int?;
}

contract AssignNestedOpt {
    val: NestedOptWrap;

    init() {
        self.val = NestedOptWrap{ inside: null };
        self.val = NestedOptWrap{ inside: 7 };
        self.val = NestedOptWrap{ inside: null };
    }
}