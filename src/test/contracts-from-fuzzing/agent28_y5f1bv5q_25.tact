contract SparseInit {
    alpha: Int;
    beta: Bool = true;
    gamma: String;

    init() {
        self.alpha = 123;
        self.gamma = "gamma";
    }
}