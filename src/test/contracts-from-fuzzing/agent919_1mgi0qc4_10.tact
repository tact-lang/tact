struct SOpt {
    inner: Bool?;
}

contract OptionalStructField2 {
    data: SOpt?;

    init() {
        self.data = null;
    }
}