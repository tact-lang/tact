struct OptionalNested {
    alpha: Int?;
    beta: Bool?;
}

contract OptionalStructFields {
    data: OptionalNested;

    init() {
        self.data = OptionalNested{
            alpha: null,
            beta: true
        };
    }
}