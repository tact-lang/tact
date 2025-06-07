struct Inner {
    s: String;
}

contract OptionalStruct {
    inner: Inner?;
    init() {
        self.inner = null;
    }
}
