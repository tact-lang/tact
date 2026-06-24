struct InnerOpt {
    f: Int?;
}

contract TestOptNested {
    inner: InnerOpt?;
    init() {
        self.inner = null;
    }
}