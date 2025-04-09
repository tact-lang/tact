struct MultiAddrOpt {
    owner: Address?;
    admin: Address?;
    backup: Address?;
}

contract OptAddrTest {
    addrs: MultiAddrOpt;
    init() {
        self.addrs = MultiAddrOpt{ owner: null, admin: myAddress(), backup: null };
    }
}