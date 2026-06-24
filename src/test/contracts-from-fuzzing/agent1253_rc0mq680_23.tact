struct WithAddress {
    addr: Address;
    n: Int;
}

contract AddrTest {
    val: WithAddress;

    init() {
        self.val = WithAddress{addr: myAddress(), n:0};
    }
}
