struct AllSliceAddress {
    s: Slice;
    sOpt: Slice?;
    a: Address;
    aOpt: Address?;
}

contract AllSliceAddressFields {
    f: AllSliceAddress;

    init() {
        self.f = AllSliceAddress{
            s: emptyCell().asSlice(),
            sOpt: null,
            a: myAddress(),
            aOpt: null
        };
    }
}