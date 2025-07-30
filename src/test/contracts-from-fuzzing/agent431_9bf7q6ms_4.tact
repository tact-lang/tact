struct OptionalNested {
    d: Int?;
    s: String?;
    b: Bool?;
}

contract OptionalFields {
    val: OptionalNested;

    init() {
        self.val = OptionalNested{
            d: null,
            s: null,
            b: null
        };
    }
}
