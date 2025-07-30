struct OptionalAddrs {
    owner: Address?;
    backup: Address?;
}

contract OptAddrHolder {
    addrs: OptionalAddrs;

    init() {
        self.addrs = OptionalAddrs{ owner:null, backup:null };
    }
}