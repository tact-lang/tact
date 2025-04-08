struct DefVals {
    a: Int = 10;
    b: String = "def";
}

contract TestContract {
    d: DefVals;

    init() {
        self.d = DefVals{};
    }

    receive() {}
}