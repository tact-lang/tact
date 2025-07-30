contract LongNamesAndOrdering {
    alpha: Int;
    beta: Bool;
    gamma: Int?;
    delta: Bool?;
    epsilon: String;
    zeta: Slice;
    eta: Cell;
    theta: Address;

    init() {
        self.alpha = 1;
        self.beta = true;
        self.gamma = null;
        self.delta = null;
        self.epsilon = "eps";
        self.zeta = emptyCell().asSlice();
        self.eta = emptyCell();
        self.theta = myAddress();
    }
}