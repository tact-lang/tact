struct NestedStrings {
    inner: InnerString;
    name: String;
}

struct InnerString {
    sentence: String;
}

contract TestContract {
    ns: NestedStrings;

    init() {
        self.ns = NestedStrings{
            inner: InnerString{ sentence: "hello world" },
            name: "outer",
        };
    }
}