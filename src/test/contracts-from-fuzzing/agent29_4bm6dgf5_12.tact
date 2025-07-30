struct OptAddr {
    val: Int;
    addr: Address?;
}

contract OptionalAddressTest {
    f: OptAddr;

    init() {
        self.f = OptAddr{
            val: 42,
            addr: null,
        };
    }
}