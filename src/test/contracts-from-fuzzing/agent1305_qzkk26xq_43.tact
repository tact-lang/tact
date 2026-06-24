struct OptAddr {
    a: Address? = null;
}

contract OptAddrTest {
    addrOpt: OptAddr;

    init() {
        self.addrOpt = OptAddr{};
    }
}