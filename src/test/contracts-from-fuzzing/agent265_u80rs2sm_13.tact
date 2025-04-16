struct AddressHolder {
    addr1: Address;
    addr2: Address;
}

contract DoubleAddress {
    value: AddressHolder;

    init() {
        self.value = AddressHolder{
            addr1: myAddress(),
            addr2: myAddress()
        };
    }

    receive() {
        self.value = self.value;
    }
}