struct SliceHolder {
    s: Slice;
}

contract WithSlice {
    data: SliceHolder;
    init() {
        self.data = SliceHolder{s: beginCell().endCell().asSlice()};
    }
}