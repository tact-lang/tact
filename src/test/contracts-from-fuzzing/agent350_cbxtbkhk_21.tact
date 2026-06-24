struct InlineStr {
    s: String;
}

contract InlineStringPersist {
    val: InlineStr;

    init() {
        self.val = InlineStr{ s: "abcdef" };
    }
}