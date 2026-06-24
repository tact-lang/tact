contract OptionalAddressTest {
    owner: Address? = null;
    backupOwner: Address?;

    init() {
        self.backupOwner = null;
    }
}
