struct NestedStrings {
    s1: String;
    s2: String;
}

struct OuterStr {
    inner: NestedStrings;
    flag: Bool;
}

contract StringsInStruct {
    data: OuterStr;

    init() {
        self.data = OuterStr{
            inner: NestedStrings{
                s1: "hi",
                s2: "bye",
            },
            flag: true,
        };
    }
}