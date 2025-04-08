struct SOpt {
    x: Int? = 42;
}

contract TestContract {
    s: SOpt;

    init() {
        self.s = SOpt{};
    }
}