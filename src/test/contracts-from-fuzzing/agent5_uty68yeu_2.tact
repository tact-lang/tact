struct Optionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
}

contract ManyOptionals {
    optionals: Optionals;

    init() {
        self.optionals = Optionals{
            intOpt: null,
            boolOpt: null,
            addressOpt: null,
            cellOpt: null,
            sliceOpt: null,
            stringOpt: null
        };
    }
}