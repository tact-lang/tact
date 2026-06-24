struct AddrWithFlag {
    addr: Address;
    used: Bool;
}

contract FlagsWithAddr {
    owner: AddrWithFlag;
    
    init() {
        self.owner = AddrWithFlag{addr: myAddress(), used: true};
    }
}
