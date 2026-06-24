contract AddressOptionals {
    owner: Address?;
    backup: Address?;

    init() {
        self.owner = null;
        self.backup = null;
    }
}