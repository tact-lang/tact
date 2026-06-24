struct OptNest {
    s: String?;
    b: Bool?;
    n: Int?;
}

contract Test {
    field: OptNest;

    init() {
        self.field = OptNest{
            s: null,
            b: null,
            n: null,
        };
    }
}