struct MultiTypes {
    x: Int;
    y: Bool;
    z: String;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
}

contract NestedMultiTypeStruct {
    mt: MultiTypes;

    init() {
        self.mt = MultiTypes{
            x: 100,
            y: false,
            z: "hi",
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
        };
    }
}