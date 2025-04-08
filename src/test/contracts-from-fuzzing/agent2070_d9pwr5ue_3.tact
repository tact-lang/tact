struct OptionalFields {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract HoldsOptional {
    opts: OptionalFields;

    init() {
        self.opts = OptionalFields{
            a: null,
            b: true,
            c: null
        };
    }
}
