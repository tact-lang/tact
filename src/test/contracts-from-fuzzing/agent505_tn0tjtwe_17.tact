contract AddressFields {
    alpha: Address;
    beta: Address;

    init() {
        let addr = myAddress();
        self.alpha = addr;
        self.beta = addr;
    }
}
