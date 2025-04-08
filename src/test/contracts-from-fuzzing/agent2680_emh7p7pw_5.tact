contract OptAddress {
    owner: Address?;

    init() {
        self.owner = myAddress();
    }
}