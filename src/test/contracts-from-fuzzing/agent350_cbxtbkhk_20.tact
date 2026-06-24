struct OptionalAddressStruct {
    addr: Address?;
}

contract AddressOptionalPersist {
    saved: OptionalAddressStruct;

    init() {
        self.saved = OptionalAddressStruct{ addr: null };
    }
}