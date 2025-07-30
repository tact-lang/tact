struct OptionalAddr {
    addr: Address?;
}

contract AddrNullTest {
    v: OptionalAddr;

    init() {
        self.v = OptionalAddr{ addr: null };
    }
}
