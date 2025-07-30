struct OptionalAddressStruct {
    addr: Address?;
}

contract OptionalAddressInStruct {
    data: OptionalAddressStruct;

    init() {
        self.data = OptionalAddressStruct{ addr: null };
    }
}