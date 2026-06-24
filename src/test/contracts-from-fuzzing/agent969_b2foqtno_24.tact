struct OptData {
    raw: Cell?;
    parsed: Slice?;
}

contract OptCellSlice {
    data: OptData;

    init() {
        self.data = OptData{
            raw: null,
            parsed: null
        };
    }
}
