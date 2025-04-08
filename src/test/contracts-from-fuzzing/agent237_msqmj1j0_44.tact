struct OptionInsideOpt {
    optInt: Int?;
    optStr: String?;
}

struct TopLevelOpt {
    nested: OptionInsideOpt?;
}

contract WrapOptOpt {
    val: TopLevelOpt;
    init() {
        self.val = TopLevelOpt{nested: null};
    }
}