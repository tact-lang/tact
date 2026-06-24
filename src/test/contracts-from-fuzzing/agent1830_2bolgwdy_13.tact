struct ComboOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    strOpt: String?;
}

contract TestContract {
    data: ComboOptionals;

    init() {
        self.data = ComboOptionals{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            cellOpt: null,
            strOpt: null
        };
    }
}
