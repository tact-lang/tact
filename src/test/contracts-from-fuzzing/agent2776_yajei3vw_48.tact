struct OptStr {
    s: String?;
}

contract OptStrTest {
    s: OptStr;

    init() {
        self.s = OptStr{};
    }
}
