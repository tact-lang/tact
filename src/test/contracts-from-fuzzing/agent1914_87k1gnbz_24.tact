struct HasAddress {
    owner: Address;
    backup: Address?;
}

contract TestContract {
    adr: HasAddress;

    init() {
        self.adr = HasAddress{ owner: myAddress(), backup: null };
    }
}