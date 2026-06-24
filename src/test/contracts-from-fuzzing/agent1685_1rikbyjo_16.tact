struct WrappedAddress {
    addr: Address;
}

contract AddressHolder {
    wrap: WrappedAddress;

    init() {
        self.wrap = WrappedAddress{
            addr: myAddress()
        };
    }
}
