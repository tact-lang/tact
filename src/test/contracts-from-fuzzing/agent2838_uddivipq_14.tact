struct OptionalStructField {
    a: Int;
}

contract OptionalStructContainer {
    s: OptionalStructField?;

    init() {
        self.s = null;
    }
}