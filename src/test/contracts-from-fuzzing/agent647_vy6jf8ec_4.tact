struct OptionalNest {
    s: String?;
    b: Bool?;
    i: Int?;
}

contract OptionalContract {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            s: null,
            b: true,
            i: null
        };
    }
}