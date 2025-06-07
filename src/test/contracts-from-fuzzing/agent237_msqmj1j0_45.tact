struct WrapperSliceCell {
    sl: Slice?;
    cl: Cell?;
}

contract StorageSlicesCellsOptional {
    val: WrapperSliceCell;
    init() {
        self.val = WrapperSliceCell{sl:null, cl:null};
    }
}