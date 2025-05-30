struct RemainSlice {
    prefix: Int;
    rest: Slice as remaining;
}

contract RemainSliceField {
    val: RemainSlice;

    init() {
        self.val = RemainSlice{prefix:5, rest: emptyCell().asSlice()};
    }
}
