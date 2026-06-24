struct SliceHolder {
    a: Slice;
    b: Slice;
    c: Slice;
}

contract SliceHolderTest {
    data: SliceHolder;

    init() {
        let s = emptyCell().asSlice();
        self.data = SliceHolder{
            a: s,
            b: s,
            c: s
        };
    }
}