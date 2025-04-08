struct OptionalCellSliceString {
    c: Cell?;
    s: Slice?;
    str: String?;
}

contract OptionalSpecialsContract {
    val: OptionalCellSliceString;

    init() {
        self.val = OptionalCellSliceString{
            c:null,
            s:emptyCell().asSlice(),
            str:null
        };
    }
}