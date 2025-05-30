struct InnerOption {
    s: String?;
}

contract OptionalStructField {
    inner: InnerOption;

    init() {
        self.inner = InnerOption{
            s: null
        };
    }
}