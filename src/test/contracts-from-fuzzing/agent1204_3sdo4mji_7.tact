struct Sub {
    foo: Int;
    bar: String;
}

contract OptionalStructField {
    data: Sub?;

    init() {
        self.data = null;
    }
}
