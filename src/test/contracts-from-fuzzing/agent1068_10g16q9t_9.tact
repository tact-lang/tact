contract TestContract {
    s: String?;

    init() {
        self.s = null;
    }

    receive() {
        self.s = self.s;
    }
}
