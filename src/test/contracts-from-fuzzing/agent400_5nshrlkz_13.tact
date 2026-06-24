struct ManyOptionalVars {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;
}

contract TestManyOptVars {
    data: ManyOptionalVars;

    init() {
        self.data = ManyOptionalVars {
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            cellOpt: null,
            sliceOpt: null,
            strOpt: null
        };
    }

    receive() {
        let _ = self.data.intOpt;
    }
}