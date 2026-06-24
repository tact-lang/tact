struct OptionalNested {
    inner: Int?;
}

contract OptionalStructField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{inner: null};
    }

    receive() {
        self.data = OptionalNested{inner: 7};
    }
}