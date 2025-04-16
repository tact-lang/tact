struct MixedRefs {
    cellField: Cell;
    sliceField: Slice;
    addrField: Address;
    num: Int;
    flag: Bool;
}

contract AllRefs {
    data: MixedRefs;

    init() {
        self.data = MixedRefs{
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            addrField: myAddress(),
            num: 999,
            flag: true,
        };
    }
}