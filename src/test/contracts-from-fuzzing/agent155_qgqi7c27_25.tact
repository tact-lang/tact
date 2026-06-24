struct HasOptionalAddress {
    addr: Address?;
    num: Int;
}

contract OptionalAddrStruct {
    val: HasOptionalAddress;
    init() {
        self.val = HasOptionalAddress{addr: null, num: 10};
    }
}