struct OptionalAddressString {
    addr: Address?;
    txt: String?;
}

contract TestOptAddrStr {
    state: OptionalAddressString;

    init() {
        self.state = OptionalAddressString{
            addr: null,
            txt: null
        };
    }
}
