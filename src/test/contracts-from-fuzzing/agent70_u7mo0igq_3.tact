struct OptionalFields {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    strOpt: String?;
}

contract TestContract {
    optData: OptionalFields;

    init() {
        self.optData = OptionalFields{
            intOpt: null,
            boolOpt: true,
            addrOpt: null,
            cellOpt: null,
            strOpt: null
        };
    }
}