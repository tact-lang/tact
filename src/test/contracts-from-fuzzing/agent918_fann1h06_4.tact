struct OptionalNest {
    a: Int?;
    b: Bool?;
}

contract TestContract {
    optNest: OptionalNest;

    init() {
        self.optNest = OptionalNest{
            a: null,
            b: true
        };
    }
}