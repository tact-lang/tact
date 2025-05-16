struct OptionalAddressHolder {
    a: Address?;
}

contract OptionalAddressField {
    optAddr: OptionalAddressHolder;

    init() {
        self.optAddr = OptionalAddressHolder{ a: null };
    }
}