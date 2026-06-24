struct InnerBoolean {
    b: Bool;
}
contract WrapBool {
    inner: InnerBoolean;
    init() {
        self.inner = InnerBoolean{ b: true };
    }
}
