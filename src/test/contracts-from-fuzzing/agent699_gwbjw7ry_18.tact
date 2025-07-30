struct Data {
    foo: Int = 1;
}

contract OptStructField {
    data: Data?;

    init() {
        self.data = null;
    }
}
