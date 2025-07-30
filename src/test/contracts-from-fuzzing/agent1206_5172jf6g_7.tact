struct CellMix {
    one: Cell;
    two: Cell?;
    three: Slice;
    four: Slice?;
}

struct IntCombo {
    first: Int;
    second: Int?;
    nested: CellMix;
}

contract Test {
    field: IntCombo;

    init() {
        self.field = IntCombo{
            first: 5,
            second: null,
            nested: CellMix{
                one: emptyCell(),
                two: null,
                three: emptyCell().asSlice(),
                four: null,
            }
        };
    }
}