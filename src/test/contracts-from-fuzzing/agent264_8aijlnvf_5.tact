struct OptionalNested {
    comment: String?;
    score: Int;
}

contract OptionalNestedField {
    info: OptionalNested?;

    init() {
        self.info = OptionalNested{
            comment: null,
            score: 10,
        };
    }
}