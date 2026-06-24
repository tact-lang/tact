struct OptionalAddressHolder {
    addr: Address?;
}

contract AddressOptionalStorage {
    data: OptionalAddressHolder;

    init() {
        self.data = OptionalAddressHolder{
            addr: null
        };
    }
}