struct OptionalNested {
    x: Int?;
    y: Bool?;
}

contract OptionalFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{x: null, y: true};
    }
}