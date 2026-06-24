struct InnerStr {
    s: String;
}

struct OuterStr {
    inner: InnerStr;
}

contract StringNest {
    fs: OuterStr;

    init() {
        self.fs = OuterStr{ inner: InnerStr{ s: "hello" } };
    }
}