struct OptionalAddressString {
    addr: Address?;
    text: String?;
}

contract OptionalAddrStr {
    s: OptionalAddressString;

    init() {
        self.s = OptionalAddressString{ addr: null, text: null };
    }
}
