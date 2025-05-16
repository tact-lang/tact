struct InnerOpt {
    x: Int?;
    message: String?;
}

contract OptionalStructField {
    inner: InnerOpt;
    init() {
        self.inner = InnerOpt{x: null, message: null};
    }
}