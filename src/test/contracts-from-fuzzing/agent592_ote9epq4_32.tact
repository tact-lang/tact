struct Chain {
    a: Int = 5;
    b: Int = 2 * 5;
    c: Int = 3 + 7;
}

contract TestContract {
    ch: Chain;

    init() {
        self.ch = Chain{};
    }

    receive() {}
}