contract TestContract {
    optBool: Bool?;

    init() {
        self.optBool = null;
    }

    receive() {
        self.optBool = true;
    }
}