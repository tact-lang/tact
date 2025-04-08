struct AddrWrapper {
    addr: Address;
    flag: Bool;
}

contract Persist {
    data: AddrWrapper;

    init() {
        self.data = AddrWrapper{
            addr: myAddress(),
            flag: true
        };
    }
}