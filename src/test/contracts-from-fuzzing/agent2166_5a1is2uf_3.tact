struct OptionalNest {
    info: String;
    count: Int?;
}

contract HasOptional {
    opt: OptionalNest;

    init() {
        self.opt = OptionalNest{
            info: "testing",
            count: null
        };
    }
}
