struct OptNested {
    x: Int?;
    y: Bool?;
    text: String?;
}

contract TestOptional {
    field: OptNested;
    init() {
        self.field = OptNested{
            x: null,
            y: true,
            text: null
        };
    }
}