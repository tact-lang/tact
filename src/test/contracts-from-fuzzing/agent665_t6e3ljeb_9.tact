struct OptionalAddressString {
    addr: Address?;
    str: String?;
}

contract TestOptAddrStr {
    data: OptionalAddressString;

    init() {
        self.data = OptionalAddressString{
            addr: null,
            str: null
        };
    }
}
