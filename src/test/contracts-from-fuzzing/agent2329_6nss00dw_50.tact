struct InnerStr {
    s: String;
}

struct OuterStr {
    inner: InnerStr;
    text: String;
}

contract StringNest {
    data: OuterStr;

    init() {
        self.data = OuterStr{
            inner: InnerStr{ s: "hi" },
            text: "world"
        };
    }
}
