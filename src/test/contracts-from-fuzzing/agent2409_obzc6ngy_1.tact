struct OptionalNested {
    a: Int;
    b: Bool?;
}

contract OptionalStructField {
    data: OptionalNested?;

    init() {
        self.data = OptionalNested{ a: 42, b: true };
    }
}