struct OptionalNest {
    innerOpt: String?;
    intOpt: Int?;
    boolOpt: Bool?;
}

contract OptionalVars {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt: "test",
            intOpt: null,
            boolOpt: true,
        };
    }
}
