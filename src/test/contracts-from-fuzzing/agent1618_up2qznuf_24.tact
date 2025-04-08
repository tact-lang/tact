struct SliceHolder {
    tail: Slice as remaining;
}

contract PersistingRemaining {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            tail: emptyCell().asSlice()
        };
    }
}