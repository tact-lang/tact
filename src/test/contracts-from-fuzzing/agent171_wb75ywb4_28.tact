struct SliceHolder {
    data: Slice;
}

contract SliceFieldTest {
    val: SliceHolder;
    init() {
        self.val = SliceHolder{ data: emptyCell().asSlice() };
    }
}