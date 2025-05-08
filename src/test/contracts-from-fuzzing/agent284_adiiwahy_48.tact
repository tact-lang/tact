struct InnerSlice {
    slice: Slice;
}

contract SliceInStorage {
    data: InnerSlice;

    init() {
        self.data = InnerSlice{
            slice: emptyCell().asSlice()
        };
    }
}