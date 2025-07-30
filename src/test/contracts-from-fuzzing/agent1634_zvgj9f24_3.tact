struct OptionalNested {
    val: Int?;
}

contract OptionalStructField {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{ val: null };
    }
}