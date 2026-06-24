struct OptionalAddressHolder {
    addr: Address?;
}

contract WithOptionalAddress {
    data: OptionalAddressHolder;

    init() {
        self.data = OptionalAddressHolder{ addr: null };
    }
}
