struct HasCell {
    slice: Slice;
    cell: Cell;
}

contract RefTest {
    data: HasCell;

    init() {
        self.data = HasCell{
            slice: emptyCell().asSlice(),
            cell: emptyCell(),
        };
    }
}