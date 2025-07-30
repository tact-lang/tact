struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFieldsDeep {
    state: OptionalNested;

    init() {
        self.state = OptionalNested{
            a: null,
            b: null,
            c: null,
        };
    }
}