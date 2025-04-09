struct NestedAddress {
    addr: Address?;
}

contract NullableAddressStruct {
    ns: NestedAddress;

    init() {
        self.ns = NestedAddress {
            addr: null
        };
    }
}