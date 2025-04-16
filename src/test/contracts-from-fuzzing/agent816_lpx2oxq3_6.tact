struct ManyOpt {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
}

contract OptFields {
    data: ManyOpt;

    init() {
        self.data = ManyOpt{
            a: null,
            b: null,
            c: null,
            d: null,
        };
    }
}
