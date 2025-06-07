struct ManyTypes {
    intVal: Int;
    boolVal: Bool;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    stringVal: String;
    addressVal: Address;
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
}

contract DiverseContract {
    mt: ManyTypes;

    init() {
        self.mt = ManyTypes{
            intVal: 10,
            boolVal: true,
            cellVal: emptyCell(),
            builderVal: beginCell(),
            sliceVal: emptyCell().asSlice(),
            stringVal: "test",
            addressVal: myAddress(),
            intOpt: null,
            boolOpt: false,
            stringOpt: null,
        };
    }
}