struct Wallet {
    owner: Address;
}

contract WithAddress {
    w: Wallet;
    init() {
        self.w = Wallet{ owner: address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c") };
    }
}