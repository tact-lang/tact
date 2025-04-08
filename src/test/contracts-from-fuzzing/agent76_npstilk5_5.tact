struct OptionalNest {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalFields {
    param: OptionalNest;

    init() {
        self.param = OptionalNest{
            s: null,
            b: true,
            i: null,
        };
    }
}