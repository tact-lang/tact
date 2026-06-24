struct MixedStruct {
    dataCell: Cell;
    dataSlice: Slice;
    count: Int;
    optionalFlag: Bool?;
}

contract WithCellSliceAndOptionals {
    storage: MixedStruct;

    init() {
        self.storage = MixedStruct{
            dataCell: emptyCell(),
            dataSlice: emptyCell().asSlice(),
            count: 1,
            optionalFlag: null
        };
    }
}