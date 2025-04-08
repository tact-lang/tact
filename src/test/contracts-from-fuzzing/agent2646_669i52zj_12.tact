struct SOpt {
    f: Int?;
}

contract NilDefaultTest {
    s: SOpt;
    init() {
        self.s = SOpt{};
    }
    receive() {}
}