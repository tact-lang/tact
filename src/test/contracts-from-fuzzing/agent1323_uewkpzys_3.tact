struct OptionalNested {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalStructField {
    s: OptionalNested;

    init() {
        self.s = OptionalNested{
            a: null,
            b: true,
            c: "test"
        };
    }
}
