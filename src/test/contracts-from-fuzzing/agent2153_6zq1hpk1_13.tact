struct NestedOpt {
    level: Int?;
    flag: Bool?;
}

struct ContainsOpt {
    nested: NestedOpt?;
    str: String?;
}

contract OptInOpt {
    data: ContainsOpt;

    init() {
        self.data = ContainsOpt{ nested: null, str: null };
    }
}
