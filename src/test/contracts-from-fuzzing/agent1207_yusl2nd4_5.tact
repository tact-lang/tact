struct OptionalNest {
    f1: Int?;
    f2: Bool?;
    f3: String?;
}

contract OptionalFields {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            f1: null,
            f2: true,
            f3: null,
        };
    }
}