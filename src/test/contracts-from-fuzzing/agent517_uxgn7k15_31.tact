struct StructAddrSlice {
    a: Address;
    s: Slice;
}

contract StructAddrSliceContract {
    val: StructAddrSlice;

    init() {
        self.val = StructAddrSlice{a: myAddress(), s: emptyCell().asSlice()};
    }
}