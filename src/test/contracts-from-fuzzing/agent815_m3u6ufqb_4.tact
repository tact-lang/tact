struct OptionalDeep {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalFields {
    val: OptionalDeep;

    init() {
        self.val = OptionalDeep{
            a: null,
            b: "str",
            c: true,
        };
    }
}