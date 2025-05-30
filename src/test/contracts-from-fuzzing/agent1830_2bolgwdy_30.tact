struct OptionalSliceCellString {
    sl: Slice?;
    ce: Cell?;
    st: String?;
}

contract TestContract {
    data: OptionalSliceCellString;

    init() {
        self.data = OptionalSliceCellString{
            sl:null,
            ce:null,
            st:null
        };
    }
}
