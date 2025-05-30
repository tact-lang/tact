struct StringNested {
    s1: String;
    inner: InnerStr;
}

struct InnerStr {
    s2: String;
    flag: Bool;
    optS: String?;
}

contract ManyStrings {
    data: StringNested;

    init() {
        self.data = StringNested{
            s1: "outer",
            inner: InnerStr{
                s2: "inner",
                flag: true,
                optS: null
            }
        };
    }
}
