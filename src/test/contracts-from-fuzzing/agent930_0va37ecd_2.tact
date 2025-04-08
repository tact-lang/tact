struct OptionalNest {
    innerOpt: Int?;
    flagOpt: Bool?;
    strOpt: String?;
}

contract OptionalInStruct {
    val: OptionalNest;

    init() {
        self.val = OptionalNest{
            innerOpt: null,
            flagOpt: null,
            strOpt: null,
        };
    }
}
