struct HasSlice {
    data: Slice;
}

contract SliceFieldTest {
    field: HasSlice;

    init() {
        self.field = HasSlice{ data: emptyCell().asSlice() };
    }
}