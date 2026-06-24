struct OptionalCells {
    a: Cell?;
    b: Slice?;
    c: Builder?;
}

contract TestContract {
    stuff: OptionalCells = OptionalCells{ a: null, b: null, c: null };

    init() {
        self.stuff = OptionalCells{
            a: emptyCell(),
            b: emptyCell().asSlice(),
            c: null
        };
    }
}