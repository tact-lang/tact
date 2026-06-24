struct OptionsStruct {
    intOpt: Int?;
    boolOpt: Bool?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
    addressOpt: Address?;
}

contract OptionalsContract {
    options: OptionsStruct;

    init() {
        self.options = OptionsStruct{
            intOpt: null,
            boolOpt: true,
            cellOpt: null,
            sliceOpt: null,
            stringOpt: null,
            addressOpt: null
        };
    }
}
