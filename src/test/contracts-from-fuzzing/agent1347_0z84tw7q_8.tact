struct DeepOptional {
    alpha: Int = 1;
    beta: Int? = null;
    gamma: Bool? = null;
}

contract TestContract {
    data: DeepOptional?;

    init() {
        self.data = null;
    }
}