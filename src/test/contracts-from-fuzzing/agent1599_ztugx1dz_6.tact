struct OptionalLayer {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptFields {
    optional: OptionalLayer;

    init() {
        self.optional = OptionalLayer{
            s: null,
            b: null,
            i: null
        };
    }
}