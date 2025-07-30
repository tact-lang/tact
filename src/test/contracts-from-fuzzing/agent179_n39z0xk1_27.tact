struct Sub {
    subval: Int;
}

contract OptionalStructField {
    data: Sub?;
    init() {
        self.data = null;
    }
}