struct AddrStruct {
    address1: Address;
    address2: Address;
}

contract MultipleAddresses {
    val: AddrStruct;
    init() {
        self.val = AddrStruct {
            address1: myAddress(),
            address2: myAddress()
        };
    }
}