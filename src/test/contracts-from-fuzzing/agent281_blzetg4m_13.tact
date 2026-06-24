struct NestedStrings {
    foo: String;
    bar: InnerString;
}

struct InnerString {
    text: String;
    flag: Bool;
}

contract StringNestedStorage {
    val: NestedStrings;

    init() {
        self.val = NestedStrings{
            foo: "Outer",
            bar: InnerString{ text: "Inner", flag: true }
        };
    }
}