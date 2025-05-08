struct HasOptionalSlice {
    sliceOpt: Slice?;
    cellOpt: Cell?;
    strOpt: String?;
}

contract OptionalCells {
    data: HasOptionalSlice;
    
    init() {
        self.data = HasOptionalSlice{
            sliceOpt: null,
            cellOpt: null,
            strOpt: null
        };
    }
}