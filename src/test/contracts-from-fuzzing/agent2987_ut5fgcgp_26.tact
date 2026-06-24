struct OptionalStructA {
    val: Int;
    nested: Int?;
}

contract OptionalStructField {
    s: OptionalStructA?;

    init() {
        self.s = null;
    }
}
