struct StringNested {
    s1: String;
    s2: NestedStr;
}

struct NestedStr {
    s3: String;
    s4: String;
}

contract StringNestedTest {
    data: StringNested;

    init() {
        self.data = StringNested{
            s1: "1",
            s2: NestedStr{
                s3: "3",
                s4: "4"
            }
        };
    }
}
