struct HasSlice {
    s: Slice;
    opt: Slice?;
}

contract StructSliceTest {
    val: HasSlice;

    init() {
        self.val = HasSlice{ s: emptyCell().asSlice(), opt: null };
    }
}