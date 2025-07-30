struct OptionalAddressStruct {
    addr: Address?;
}

contract TestContract {
    s: OptionalAddressStruct = OptionalAddressStruct{ addr: null };

    init() {
        self.s = OptionalAddressStruct{ addr: null };
    }
}