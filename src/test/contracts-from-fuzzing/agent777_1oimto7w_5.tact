struct OptionalDeep {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalDeepContract {
    field: OptionalDeep;

    init() {
        self.field = OptionalDeep{
            a: null,
            b: null,
            c: true,
        };
    }
}