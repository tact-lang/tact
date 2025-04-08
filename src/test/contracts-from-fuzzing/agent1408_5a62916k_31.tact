struct SliceHolder {
    prefix: Int;
    rest: Slice as remaining;
}

contract TestContract {
    data: SliceHolder;

    init() {
        self.data = SliceHolder{
            prefix: 55,
            rest: emptyCell().asSlice(),
        };
    }
}