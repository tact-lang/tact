struct InlineStr {
    s: String;
}

contract StringInline {
    f: InlineStr;

    init() {
        self.f = InlineStr{ s: "hello" };
    }
}
