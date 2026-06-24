struct OptionalAddress {
    addr: Address?;
    val: Int;
}

contract OptAddressTest {
    s: OptionalAddress;

    init() {
        self.s = OptionalAddress{ addr:null, val:99 };
    }
}