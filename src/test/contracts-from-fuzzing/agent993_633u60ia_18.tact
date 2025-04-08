struct SliceHolder {
    data: Slice;
    optionalData: Slice?;
}

contract TestContract {
    store: SliceHolder;

    init() {
        self.store = SliceHolder{
            data: emptyCell().asSlice(),
            optionalData: null
        };
    }
}