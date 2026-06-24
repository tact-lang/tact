struct Data {
    x: Int;
}

contract OptionalStructField {
    maybeData: Data?;

    init() {
        self.maybeData = null;
    }
}
