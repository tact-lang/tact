struct HasSlice {
    s: Slice;
}

contract TestContract {
    val: HasSlice;

    init() {
        self.val = HasSlice{ s: emptyCell().asSlice() };
    }
}