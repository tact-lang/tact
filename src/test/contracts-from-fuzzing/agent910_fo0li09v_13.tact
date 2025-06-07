struct ContainAddr {
    a: Address;
    b: Address;
}

contract AddrState {
    data: ContainAddr;

    init() {
        self.data = ContainAddr{
            a: myAddress(),
            b: myAddress()
        };
    }
}