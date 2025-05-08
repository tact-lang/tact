contract OptionalAddressTest {
    a: Address?;

    init() {
        self.a = null;
        self.a = myAddress();
    }
}