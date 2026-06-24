struct OptNested {
    val: Int;
    nested: Bool?;
}

contract OptionalStructField {
    s: OptNested;
    init() {
        self.s = OptNested{val: 99, nested: null};
    }
}