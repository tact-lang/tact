struct HasSlice {
    data: Slice;
}

contract SliceInField {
    s: HasSlice;

    init() {
        self.s = HasSlice{
            data: beginCell().endCell().asSlice()
        };
    }
}