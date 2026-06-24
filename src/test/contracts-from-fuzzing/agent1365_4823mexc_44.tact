contract ChangeOpt {
    a: Int?;

    init() {
        self.a = null;
    }

    receive() {
        self.a = 42;
    }
}