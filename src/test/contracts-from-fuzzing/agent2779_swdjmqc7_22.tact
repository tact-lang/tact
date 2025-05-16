struct OptionalAddressHolder {
    addr: Address?;
}

contract HoldingOptionalAddress {
    holder: OptionalAddressHolder;
    init() {
        self.holder = OptionalAddressHolder{
            addr: null
        };
    }
}