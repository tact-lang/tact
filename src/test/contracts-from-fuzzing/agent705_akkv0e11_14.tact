struct OptAddrString {
    addr: Address?;
    name: String?;
}

contract OptionalAddressString {
    data: OptAddrString;

    init() {
        self.data = OptAddrString {
            addr: null,
            name: null
        };
    }
}