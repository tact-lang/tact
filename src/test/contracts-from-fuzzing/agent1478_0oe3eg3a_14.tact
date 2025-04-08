struct SliceStruct {
    s: Slice;
    num: Int;
}

contract SliceContract {
    data: SliceStruct;
    init() {
        self.data = SliceStruct{ s: beginCell().endCell().asSlice(), num: 12 };
    }
}
