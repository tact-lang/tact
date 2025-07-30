struct AddressAndSlice {
    addr: Address;
    sl: Slice;
}

contract AddressSliceContract {
    d: AddressAndSlice;

    init() {
        self.d = AddressAndSlice{addr:myAddress(), sl:emptyCell().asSlice()};
    }

    receive() {
        self.d = AddressAndSlice{addr:myAddress(), sl:emptyCell().asSlice()};
    }
}