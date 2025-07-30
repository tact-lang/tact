struct SimpleAddressHolder {
    addr: Address;
}

contract AddressContract {
    holder: SimpleAddressHolder;
    init() {
        self.holder = SimpleAddressHolder{ addr: myAddress() };
    }
}