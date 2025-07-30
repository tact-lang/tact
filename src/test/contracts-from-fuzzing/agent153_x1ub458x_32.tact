struct HasAddressAndSlice {
    addr: Address;
    sl: Slice;
}

contract MixSliceAddress {
    val: HasAddressAndSlice;

    init() {
        self.val = HasAddressAndSlice{
            addr: myAddress(),
            sl: emptyCell().asSlice()
        };
    }
}