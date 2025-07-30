struct OptionalNest {
    a: Int?;
    b: Bool?;
}

contract OptNested {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            a: null,
            b: true,
        };
    }
}