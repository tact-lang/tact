struct SOpt {
    a: Int?;
    b: String?;
    c: Bool?;
}

contract OptionalFields {
    d: SOpt;

    init() {
        self.d = SOpt{
            a: null,
            b: null,
            c: null
        };
    }
}
