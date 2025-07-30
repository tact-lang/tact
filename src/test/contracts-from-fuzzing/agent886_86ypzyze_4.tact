struct OptionalNest {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;
}

contract TestContract {
    optData: OptionalNest;
    init() {
        self.optData = OptionalNest{
            intOpt: null,
            boolOpt: true,
            addrOpt: myAddress(),
            cellOpt: emptyCell(),
            sliceOpt: emptyCell().asSlice(),
            strOpt: "optional"
        };
    }
}