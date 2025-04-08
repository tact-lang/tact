struct NestedStr {
    s: String;
    opt_s: String?;
}

contract StringNestOptional {
    inner: NestedStr;

    init() {
        self.inner = NestedStr{ s: "hello", opt_s: null };
    }
}
