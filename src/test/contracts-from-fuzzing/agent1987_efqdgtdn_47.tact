struct OptionalAddressStr {
    addr: Address?;
    str: String?;
}

contract OptionalAddrStr {
    data: OptionalAddressStr;
    init() {
        self.data = OptionalAddressStr{
            addr:null,
            str:"hello"
        };
    }
}