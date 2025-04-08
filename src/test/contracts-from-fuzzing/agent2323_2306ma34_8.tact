struct NestedStrings {
    s1: String;
    s2: String;
    nested: InnerString;
}

struct InnerString {
    s3: String;
    s4: String;
}

contract StringsNestedTest {
    data: NestedStrings;

    init() {
        self.data = NestedStrings{
            s1: "abc",
            s2: "def",
            nested: InnerString{
                s3: "ghi",
                s4: "jkl"
            }
        };
    }
}