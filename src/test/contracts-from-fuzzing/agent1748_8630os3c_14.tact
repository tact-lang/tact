struct OptionalStruct {
    intOpt: Int?;
    addrOpt: Address?;
    cellOpt: Cell?;
    boolOpt: Bool?;
    sliceOpt: Slice?;
    stringOpt: String?;
}

contract OptionalVars {
    data: OptionalStruct?;

    init() {
        self.data = null;
    }
}