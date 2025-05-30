struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructFields {
    optField: OptionalNest;

    init() {
        self.optField = OptionalNest{
            a: null,
            b: true,
            c: "hello"
        };
    }
}