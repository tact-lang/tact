struct NestedSlice {
    data: Slice;
    flag: Bool;
}

contract PersistSliceStruct {
    val: NestedSlice;

    init() {
        self.val = NestedSlice{
            data: emptyCell().asSlice(),
            flag: true
        };
    }
}