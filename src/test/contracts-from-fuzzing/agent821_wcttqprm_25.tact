// test slice inside struct persistence
struct SliceHolder {
    s: Slice;
}

contract TestStructWithSlice {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            s: emptyCell().asSlice()
        };
    }
}
