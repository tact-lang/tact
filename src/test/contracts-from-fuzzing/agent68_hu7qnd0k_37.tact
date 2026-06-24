struct MultiAddr {
    owner: Address;
    admin: Address;
    backup: Address;
}

contract AddrHolder {
    addrs: MultiAddr;

    init() {
        let me = myAddress();
        self.addrs = MultiAddr{
            owner: me,
            admin: me,
            backup: me
        };
    }
}
