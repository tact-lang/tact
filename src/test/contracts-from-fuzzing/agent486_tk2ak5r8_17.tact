struct AddressOpt {
    addr: Address?;
}

contract TestAddressOpt {
    data: AddressOpt;

    init() {
        self.data = AddressOpt{
            addr: null
        };
    }
}