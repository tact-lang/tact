struct OptionalCellAndStrings {
    maybeCell: Cell?;
    maybeStr: String?;
    maybeSlice: Slice?;
}

contract OptionalCellString {
    data: OptionalCellAndStrings;
    init() {
        self.data = OptionalCellAndStrings{maybeCell:null,maybeStr:null,maybeSlice:null};
    }
}