struct OptionalSliceCell {
    s: Slice?;
    c: Cell?;
}

contract TestContract {
    stuff: OptionalSliceCell;

    init() {
        self.stuff = OptionalSliceCell{
            s: null,
            c: null
        };
    }
}