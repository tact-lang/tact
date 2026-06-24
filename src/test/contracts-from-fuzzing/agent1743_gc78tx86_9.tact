struct StringNest {
    s1: String;
    s2: NestedStr;
}

struct NestedStr {
    ns1: String;
    ns2: String;
}

contract StringStructs {
    data: StringNest;

    init() {
        self.data = StringNest{
            s1: "abc",
            s2: NestedStr{
                ns1: "def",
                ns2: "ghi",
            },
        };
    }
}