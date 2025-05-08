struct OptionalCells {
    a: Cell?;
    b: Cell?;
}

contract CellOptionals {
    holder: OptionalCells;

    init() {
        self.holder = OptionalCells{
            a:null,
            b:null
        };
    }
}