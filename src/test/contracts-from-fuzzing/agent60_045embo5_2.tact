contract TestContract {
    optionalFlag: Bool? = null;

    init() {
        self.optionalFlag = true;
    }

    receive() {}
}
