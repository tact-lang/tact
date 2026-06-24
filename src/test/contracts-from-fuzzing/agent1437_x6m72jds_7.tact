struct NestedOpt {
    op1: Int?;
    op2: Int?;
}

struct HasNestedOpt {
    fieldOpt: NestedOpt?;
}

contract NestedOptionalInStruct {
    s: HasNestedOpt;

    init() {
        self.s = HasNestedOpt{ fieldOpt: null };
    }
}