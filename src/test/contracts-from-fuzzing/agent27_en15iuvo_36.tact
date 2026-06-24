struct NestedStr {
    s: String?;
}

contract InnerDefaultNull {
    inner: NestedStr;

    init() {
        self.inner = NestedStr{};
    }
}