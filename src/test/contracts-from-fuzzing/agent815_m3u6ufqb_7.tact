struct OptionalStructInside {
    val: Int;
}

contract OptionalStructField {
    test: OptionalStructInside?;

    init() {
        self.test = null;
    }
}