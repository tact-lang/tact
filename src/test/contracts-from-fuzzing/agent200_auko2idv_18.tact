contract OptionalAddressTest {
    owner: Address?;
    backup: Address?;
    init() {
        self.owner = null;
        self.backup = null;
    }
}