struct OptionalAddressStruct {
    addr: Address? = null;
}

contract TestContract {
    s: OptionalAddressStruct;

    init() {
        self.s = OptionalAddressStruct{};
    }
}