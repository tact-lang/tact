struct OptionalSlice {
    s: Slice?;
    c: Cell?;
}

contract TestContract {
    data: OptionalSlice;
    init() {
        self.data = OptionalSlice{
            s: null,
            c: emptyCell()
        };
    }
}