struct OptNonNull {
    cell: Cell?;
    slice: Slice?;
}

contract FilledOptionals {
    data: OptNonNull;

    init() {
        self.data = OptNonNull{
            cell: emptyCell(),
            slice: emptyCell().asSlice()
        };
    }
}