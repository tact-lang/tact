struct SliceHolder {
    s: Slice;
}

contract SliceInState {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            s: emptyCell().asSlice()
        };
    }
}
