struct HasSlice {
    s: Slice;
}

contract SliceFieldTest {
    val: HasSlice;

    init() {
        self.val = HasSlice{ s: emptyCell().asSlice() };
    }
}