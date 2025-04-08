struct ValWithSlice {
    data: Slice;
}

contract SliceHolder {
    val: ValWithSlice;

    init() {
        self.val = ValWithSlice{
            data: emptyCell().asSlice(),
        };
    }
}