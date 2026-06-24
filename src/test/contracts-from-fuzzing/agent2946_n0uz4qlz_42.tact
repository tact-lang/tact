struct InnerOpts {
    a: Int?;
    b: Bool?;
}
contract OuterOptStruct {
    inner: InnerOpts?;
    init() {
        self.inner = null;
    }
}