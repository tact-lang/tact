struct OptionalCombos {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract TestContract {
    mixedOpts: OptionalCombos;

    init() {
        self.mixedOpts = OptionalCombos{
            a: null,
            b: false,
            c: "text",
            d: 42,
            e: null
        };
    }
}