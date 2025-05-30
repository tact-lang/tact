contract AddressInit {
    owner: Address;
    init() {
        self.owner = myAddress();
    }
}