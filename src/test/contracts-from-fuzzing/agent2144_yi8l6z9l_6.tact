struct NestedStrings {
    text1: String;
    text2: String;
    text3: String;
}

contract StringFields {
    s: NestedStrings;

    init() {
        self.s = NestedStrings{ text1: "one", text2: "two", text3: "three" };
    }
}
