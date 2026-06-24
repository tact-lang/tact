struct OptionalAddressStruct {
    addr: Address?;
}

contract OptionalAddressStorage {
    entry: OptionalAddressStruct;

    init() {
        self.entry = OptionalAddressStruct{
            addr: null,
        };
    }
}
