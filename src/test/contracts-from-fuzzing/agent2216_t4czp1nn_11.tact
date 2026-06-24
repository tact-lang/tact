struct SliceHolder {
    sl: Slice;
    optSl: Slice?;
}

contract SliceTest {
    storage: SliceHolder;
    init() {
        self.storage = SliceHolder{
            sl: emptyCell().asSlice(),
            optSl: null
        };
    }
}
