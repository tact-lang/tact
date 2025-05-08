struct OptionalSlice {
    a: Slice?;
    b: Cell;
}

contract OptSliceTest {
    data: OptionalSlice;

    init() {
        self.data = OptionalSlice{
            a: null,
            b: emptyCell()
        };
    }
}