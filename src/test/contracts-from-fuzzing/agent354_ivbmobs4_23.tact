struct OptionalAddr {
    addr: Address?;
    s: String;
}

contract OptionalAddressTest {
    data: OptionalAddr;

    init() {
        self.data = OptionalAddr{addr:null,s:"hi"};
    }
}