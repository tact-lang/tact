struct Addrs {
    addr1: Address;
    addrOpt: Address?;
}

contract AddressStruct {
    info: Addrs;

    init() {
        self.info = Addrs{
            addr1: myAddress(),
            addrOpt: null
        };
    }
}