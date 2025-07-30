contract AddressNullable {
    owner: Address?;
    admin: Address?;

    init() {
        self.owner = null;
        self.admin = null;
    }
}
