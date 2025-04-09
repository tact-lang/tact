struct InnerOpt {
    x: Int?;
    y: Bool?;
}

contract OptionalStructField {
    inner: InnerOpt?;
    
    init() {
        self.inner = null;
    }
}