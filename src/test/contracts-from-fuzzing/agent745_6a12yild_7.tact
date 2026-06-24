struct SerialOpts {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    stringOpt: String?;
}

contract OptionalFields {
    values: SerialOpts;

    init() {
        self.values = SerialOpts{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            cellOpt: null,
            stringOpt: null
        };
    }
}