struct StrNest {
    s1: String;
    s2: OptionS;
}

struct OptionS {
    s: String?;
}

contract OptStringBoth {
    data: StrNest;

    init() {
        self.data = StrNest{
            s1: "abc",
            s2: OptionS{ s: null }
        };
    }
}