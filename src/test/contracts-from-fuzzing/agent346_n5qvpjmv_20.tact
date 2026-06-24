struct WithAddress {
    addr: Address;
    optAddr: Address?;
}

contract StructAddress {
    data: WithAddress;
    init() {
        self.data = WithAddress{
            addr: myAddress(),
            optAddr: null
        };
    }
}