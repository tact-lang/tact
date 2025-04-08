struct StructWithAddresses {
    addr1: Address;
    addr2: Address;
    addr3: Address;
    addr4: Address;
}

contract StructAddresses {
    data: StructWithAddresses;

    init() {
        self.data = StructWithAddresses{
            addr1: myAddress(),
            addr2: myAddress(),
            addr3: myAddress(),
            addr4: myAddress(),
        };
    }
}