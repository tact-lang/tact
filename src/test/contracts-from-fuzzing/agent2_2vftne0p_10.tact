struct SliceHolder {
    slice1: Slice;
    slice2: Slice;
}

contract TestContract {
    holder: SliceHolder;

    init() {
        self.holder = SliceHolder{
            slice1: emptyCell().asSlice(),
            slice2: emptyCell().asSlice(),
        };
    }
}