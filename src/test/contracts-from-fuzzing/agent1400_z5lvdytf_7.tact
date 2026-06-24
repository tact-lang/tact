struct OptionalsDummy {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Cell?;
    e: Slice?;
    f: Builder?;
    g: Address?;
}

contract OptionalFields {
    data: OptionalsDummy;

    init() {
        self.data = OptionalsDummy{
            a: null, b: null, c: null, d: null,
            e: null, f: null, g: null
        };
    }
}
