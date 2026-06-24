struct AddressWrap {
    a: Address?;
    b: Address?;
}

contract OptionalAddrStruct {
    s: AddressWrap?;

    init() {
        self.s = null;
    }
}