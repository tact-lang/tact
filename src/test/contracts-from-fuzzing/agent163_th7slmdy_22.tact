struct InnerOption {
    flag: Bool?;
}

contract OptionalStructField {
    data: InnerOption?;

    init() {
        self.data = null;
    }
}