struct HasSlice {
    s: Slice;
}

contract SliceStorage {
    data: HasSlice;

    init() {
        self.data = HasSlice{s: emptyCell().asSlice()};
    }

    receive() {
        let _ = self.data.s.bits();
    }
}