struct StringsNested {
    a: String;
    b: String?;
    inner: InnerString;
}

struct InnerString {
    s1: String;
    s2: String?;
}

contract StringsNestedTest {
    val: StringsNested;

    init() {
        self.val = StringsNested{
            a: "one",
            b: null,
            inner: InnerString{
                s1: "two",
                s2: null,
            },
        };
    }
}