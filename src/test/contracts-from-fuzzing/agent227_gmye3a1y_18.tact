struct AddressStruct {
    addr: Address;
    optAddr: Address?;
}

contract TestContract {
    data: AddressStruct;

    init() {
        self.data = AddressStruct {
            addr: myAddress(),
            optAddr: null
        };
    }
}