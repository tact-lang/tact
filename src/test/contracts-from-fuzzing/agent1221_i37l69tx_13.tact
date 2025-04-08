struct Addressing {
    myAddr: Address;
    someAddr: Address;
}

contract Addrs {
    record: Addressing;

    init() {
        self.record = Addressing{
            myAddr: myAddress(),
            someAddr: myAddress(),
        };
    }
}