struct OptionalCrazy {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    addrOpt: Address?;
}

contract TestContract {
    optData: OptionalCrazy;
    init() {
        self.optData = OptionalCrazy{
            intOpt: null,
            boolOpt: true,
            strOpt: null,
            sliceOpt: null,
            cellOpt: null,
            addrOpt: null,
        };
    }
}