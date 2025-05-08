struct MixedPrimsOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    builderOpt: Builder?;
    stringOpt: String?;
}

contract MixedPrimsOptionalsTest {
    dat: MixedPrimsOptionals;

    init() {
        self.dat = MixedPrimsOptionals{
            intOpt: null,
            boolOpt: null,
            addrOpt: null,
            sliceOpt: null,
            cellOpt: null,
            builderOpt: null,
            stringOpt: null,
        };
    }
}