struct OptNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptFields {
    v: OptNest;

    init() {
        self.v = OptNest{
            a: null,
            b: null,
            c: null
        };
    }
}