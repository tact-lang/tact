struct Sub {
    val: Int;
}

contract OptionalStructField {
    maybe: Sub?;

    init() {
        self.maybe = null;
    }
}