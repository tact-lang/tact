struct OptOpt {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptionalFields {
    data: OptOpt;

    init() {
        self.data = OptOpt{
            a: null,
            b: true,
            c: null
        };
    }
}
