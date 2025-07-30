// Persistent optional address and slice with some non-null initialization
contract OptNonNull {
    addrOpt: Address?;
    sliceOpt: Slice?;

    init() {
        self.addrOpt = myAddress();
        self.sliceOpt = emptyCell().asSlice();
    }
}