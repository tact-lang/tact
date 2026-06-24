// Struct using all primitive types without serialization hints
struct PrimitivesGroup {
    num: Int;
    flag: Bool;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String;
}

contract PrimitivesPersist {
    val: PrimitivesGroup;

    init() {
        self.val = PrimitivesGroup{
            num: 42,
            flag: true,
            addr: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            strVal: "hey"
        };
    }
}