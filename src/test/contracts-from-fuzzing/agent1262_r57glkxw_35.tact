struct OptionalSliceCell {
    a: Slice?;
    b: Cell?;
}

contract NestedOptionals2 {
    o: OptionalSliceCell;

    init() {
        self.o = OptionalSliceCell{a: null, b: null};
    }
}