struct OptionalNest {
    value: Int?;
    strOpt: String?;
    boolOpt: Bool?;
}

contract OptionalStructContract {
    data: OptionalNest;

    init() {
        self.data = OptionalNest{
            value: null,
            strOpt: "text",
            boolOpt: null
        };
    }
}
