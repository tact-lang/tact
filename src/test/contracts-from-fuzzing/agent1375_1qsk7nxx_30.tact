struct InnerStr {
    s: String;
}

contract OptInsideStruct {
    inner: InnerStr?;

    init() {
        self.inner = null;
    }
}