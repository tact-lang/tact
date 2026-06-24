struct OptionalNest {
    innerOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    intOpt: Int?;
}

contract OptionalStructStorage {
    stored: OptionalNest?;

    init() {
        self.stored = OptionalNest{
            innerOpt: null,
            strOpt: null,
            addrOpt: null,
            intOpt: null
        };
    }
}