struct NestedOptional {
    text: String?;
    number: Int?;
}

contract OptionalFields {
    info: NestedOptional;

    init() {
        self.info = NestedOptional{
            text: null,
            number: null
        };
    }
}
