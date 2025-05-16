struct NestedBoolOptional {
    opt: Bool?;
}

contract NestedBoolOptCtr {
    val: NestedBoolOptional;

    init() {
        self.val = NestedBoolOptional { opt: null };
    }
}