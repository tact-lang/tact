struct StrNest {
    s: String;
    inner: InnerS;
}

struct InnerS {
    s2: String;
    flag: Bool;
}

contract StringNested {
    s: StrNest;

    init() {
        self.s = StrNest{
            s: "outer",
            inner: InnerS{
                s2: "inner",
                flag: true,
            }
        };
    }
}
