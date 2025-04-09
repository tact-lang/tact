struct OptionalAddressStruct {
    addr: Address?;
}

contract OptionalAddressField {
    oa: OptionalAddressStruct;

    init() {
        self.oa = OptionalAddressStruct{ addr: null };
    }
}