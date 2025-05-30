struct OptionalNest {
    inn: Int?;
}

contract NullSet {
    f: OptionalNest;

    init() {
        self.f = OptionalNest{
            inn: null
        };
    }
}
