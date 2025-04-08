struct NestedStrings {
    s1: String;
    s2: String?;
    sub: SubStr;
}

struct SubStr {
    x: Int;
    name: String;
}

contract Test {
    s: NestedStrings;

    init() {
        self.s = NestedStrings{
            s1: "abc",
            s2: null,
            sub: SubStr{
                x: 5,
                name: "yo"
            }
        };
    }
}
