contract NestedMessageHolder {
    inner: Msg?;

    init() {
        self.inner = null;
    }
}

message(555) Msg {
    foo: Int;
}
