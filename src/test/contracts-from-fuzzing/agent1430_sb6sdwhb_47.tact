struct OptionalAddr {
    a: Address?;
}

contract AddrOptTest {
    s: OptionalAddr;

    init() {
        self.s = OptionalAddr{
            a: null
        };
    }
}
