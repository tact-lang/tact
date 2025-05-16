struct EmptyOpt {
    opt1: Int?;
}

struct InnerOpt {
    opt: EmptyOpt?;
}

contract NestedOptionalStruct {
    val: InnerOpt;

    init() {
        self.val = InnerOpt{ opt: null };
    }
}