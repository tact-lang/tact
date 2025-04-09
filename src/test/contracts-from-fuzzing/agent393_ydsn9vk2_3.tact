struct OptionalNest {
    x: Int?;
    y: Bool?;
    s: String?;
}

contract OptFields {
    data: OptionalNest = OptionalNest{
        x: null,
        y: null,
        s: null,
    };
    init() {
        self.data = OptionalNest{
            x: 42,
            y: true,
            s: "hello",
        };
    }
}