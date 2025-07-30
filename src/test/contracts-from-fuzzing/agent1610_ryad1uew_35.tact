struct WrappedSlice {
    s: Slice;
}

contract SliceFieldContract {
    x: WrappedSlice;

    init() {
        self.x = WrappedSlice{s: emptyCell().asSlice()};
    }
}