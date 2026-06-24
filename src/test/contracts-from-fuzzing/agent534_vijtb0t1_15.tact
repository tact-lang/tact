struct OptionalEmpty {
    s: String?;
    i: Int?;
    b: Bool?;
}

contract OptDefaults {
    field: OptionalEmpty;

    init() {
        self.field = OptionalEmpty{
            s: null,
            i: null,
            b: null,
        };
    }
}