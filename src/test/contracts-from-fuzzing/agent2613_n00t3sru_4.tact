struct OptsNest {
    a: Int?;
    b: String?;
    c: Bool?;
    s: Cell?;
}

contract OptionalFields {
    data: OptsNest;

    init() {
        self.data = OptsNest{
            a: null,
            b: null,
            c: null,
            s: null,
        };
    }
}