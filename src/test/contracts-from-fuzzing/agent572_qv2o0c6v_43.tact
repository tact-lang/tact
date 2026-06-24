struct SOptOpt {
    opt1: Int?;
    opt2: Bool?;
}

contract NestedOptStructs {
    s1: SOptOpt;
    s2: SOptOpt;
    init() {
        self.s1 = SOptOpt { opt1: null, opt2: null };
        self.s2 = SOptOpt { opt1: null, opt2: null };
    }
}