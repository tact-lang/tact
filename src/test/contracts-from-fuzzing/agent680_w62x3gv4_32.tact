contract OptionalAddressTest {
    optAddr: Address? = null;

    init() {
        self.optAddr = myAddress();
    }

    receive() {
        let exists = self.optAddr != null;
    }
}