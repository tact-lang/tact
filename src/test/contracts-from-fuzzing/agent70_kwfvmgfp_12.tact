contract TestContract {
    optInt: Int?;

    init() {
        self.optInt = null;
    }

    receive() {
        self.optInt = 777;
    }
}