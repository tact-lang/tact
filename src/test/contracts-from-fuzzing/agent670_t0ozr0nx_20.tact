struct SliceHolder {
    s: Slice;
}

contract TestContract {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            s: emptyCell().asSlice()
        };
    }
}