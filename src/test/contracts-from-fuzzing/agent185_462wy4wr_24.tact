struct SliceAndAddress {
    data: Slice;
    addr: Address;
}

contract SliceAddressContract {
    info: SliceAndAddress;

    init() {
        self.info = SliceAndAddress{
            data: emptyCell().asSlice(),
            addr: myAddress()
        };
    }
}