struct OptNest {
    a: Int?;
    b: Bool?;
    c: String?;
}

contract OptStorage {
    field: OptNest;
    init() {
        self.field = OptNest{
            a: null,
            b: true,
            c: null
        };
    }
}