struct InnerOpt {
    a: Int?;
    b: Bool?;
}

contract OptStructField {
    inner: InnerOpt?;

    init() {
        self.inner = null;
    }
}