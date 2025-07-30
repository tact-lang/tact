struct InnerAddr {
    addr: Address;
}

contract StructAddressStorage {
    s: InnerAddr;
    
    init() {
        self.s = InnerAddr{
            addr: myAddress()
        };
    }
}