struct StrNest {
    s: String;
    nested: NestedStr;
}

struct NestedStr {
    txt: String;
    flag: Bool;
}

contract TestStrNested {
    data: StrNest;
    init() {
        self.data = StrNest{
            s: "level1",
            nested: NestedStr{
                txt: "level2",
                flag: true,
            },
        };
    }
}
