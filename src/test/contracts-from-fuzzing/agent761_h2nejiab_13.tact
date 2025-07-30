struct OptAddress {
    addr: Address?;
    name: String;
}

contract OptionalAddressInStruct {
    item: OptAddress;

    init() {
        self.item = OptAddress{ addr: null, name: "X" };
    }
}
