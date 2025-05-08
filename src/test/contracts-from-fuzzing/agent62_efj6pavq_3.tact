struct OptionalNest {
    innerOpt1: Int?;
    innerOpt2: String?;
    innerOpt3: Bool?;
}

contract OptionalDeep {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            innerOpt1: null,
            innerOpt2: null,
            innerOpt3: null,
        };
    }
}
