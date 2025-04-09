struct AddressAndSlice {
    addr: Address;
    sl: Slice;
}

contract AddressAndSliceContract {
    data: AddressAndSlice;

    init() {
        self.data = AddressAndSlice{
            addr: myAddress(),
            sl: emptyCell().asSlice()
        };
    }
}