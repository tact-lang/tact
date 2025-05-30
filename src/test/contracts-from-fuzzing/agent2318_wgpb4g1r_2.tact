struct WithOptionals {
    flagOpt: Bool?;
    intOpt: Int?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
}

contract TestContract {
    data: WithOptionals = WithOptionals{
        flagOpt: null,
        intOpt: null,
        addrOpt: null,
        cellOpt: null,
        sliceOpt: null,
        stringOpt: null,
    };

    init() {
        self.data = WithOptionals{
            flagOpt: true,
            intOpt: 5,
            addrOpt: myAddress(),
            cellOpt: emptyCell(),
            sliceOpt: emptyCell().asSlice(),
            stringOpt: "opt string"
        };
    }
}
