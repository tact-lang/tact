struct HasSliceAndAddress {
    part: Slice;
    addr: Address;
}

contract SliceAddressFields {
    storage: HasSliceAndAddress;

    init() {
        self.storage = HasSliceAndAddress{
            part: emptyCell().asSlice(),
            addr: myAddress(),
        };
    }

    receive() {
        let s = self.storage.part;
        let a = self.storage.addr;
    }
}