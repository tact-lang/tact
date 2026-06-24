contract ManyAddresses {
    alpha: Address;
    beta: Address;
    gamma: Address;

    init() {
        self.alpha = myAddress();
        self.beta = myAddress();
        self.gamma = myAddress();
    }
}