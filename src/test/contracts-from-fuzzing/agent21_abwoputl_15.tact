struct InnerStr {
    text: String;
}

struct OuterStr {
    label: String;
    inner: InnerStr;
}

contract StringsNested {
    content: OuterStr;

    init() {
        self.content = OuterStr{ label: "outer", inner: InnerStr{ text: "inner" } };
    }
}
