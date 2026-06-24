struct OptionalNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStorage {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            a: null,
            b: null,
            c: "abc",
        };
    }
}