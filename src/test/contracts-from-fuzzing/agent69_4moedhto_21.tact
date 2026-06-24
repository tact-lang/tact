struct OptionalSlicesCells {
    s: Slice?;
    c: Cell?;
    b: Builder?;
}

contract OptionalSlicesCellsTest {
    data: OptionalSlicesCells;

    init() {
        self.data = OptionalSlicesCells{
            s: null,
            c: null,
            b: null
        };
    }
}