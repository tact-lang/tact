struct Data {
    i: Int;
    b: Bool;
}

contract OptionalStructField {
    data: Data?;

    init() {
        self.data = null;
    }
}