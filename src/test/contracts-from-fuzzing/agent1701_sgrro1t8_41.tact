struct OptAddr {
    a: Address?;
}

contract OptAddrTest {
    state: OptAddr;

    init() {
        self.state = OptAddr{a:null};
    }
}