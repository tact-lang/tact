contract OptFields {
    alpha: Int?;
    beta: Bool?;
    gamma: Address?;

    init() {
        self.alpha = null;
        self.beta = true;
        self.gamma = myAddress();
    }
}