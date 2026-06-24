struct MultiDefaultOpt {
    a: Int = 5;
    b: Bool? = null;
    c: String? = null;
}

contract Test {
    f: MultiDefaultOpt;

    init() {
        self.f = MultiDefaultOpt{};
    }
}