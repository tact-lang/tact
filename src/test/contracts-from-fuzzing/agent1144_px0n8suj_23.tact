// test persistent Address optionals
contract AddressOptionals {
    owner: Address?;
    admin: Address?;

    init() {
        self.owner = null;
        self.admin = null;
    }
}