struct OptionalOnly {
    a: Int?;
    b: Bool?;
    s: String?;
}

contract NullAllOpt {
    record: OptionalOnly;

    init() {
        self.record = OptionalOnly{
            a: null,
            b: null,
            s: null
        };
    }
}