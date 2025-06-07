struct SliceHolder {
    sl: Slice;
    num: Int;
}

contract SliceFieldTest {
    data: SliceHolder;

    init() {
        self.data = SliceHolder {
            sl: emptyCell().asSlice(),
            num: 42
        };
    }
}