struct OptionalContainer {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    addrOpt: Address?;
}

contract OptWrap {
    item: OptionalContainer;

    init() {
        self.item = OptionalContainer{
            intOpt: null,
            boolOpt: null,
            stringOpt: null,
            cellOpt: null,
            addrOpt: null
        };
    }
}