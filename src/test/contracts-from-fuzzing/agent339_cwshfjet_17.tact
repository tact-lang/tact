struct InlineDefaults {
    a: Int = 5;
    b: Bool = true;
    c: String = "text";
    d: Int?;
    e: String?;
}

contract InlineDefaultsStore {
    data: InlineDefaults;

    init() {
        self.data = InlineDefaults{
            // intentionally override defaults
            a: 10,
            b: false,
            c: "override",
            d: null,
            e: null
        };
    }
}