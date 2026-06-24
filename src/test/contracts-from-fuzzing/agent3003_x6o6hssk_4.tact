struct OptionalNested {
    value: Int?;
}

contract OptionalStructField {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{ value: null };
    }
}
