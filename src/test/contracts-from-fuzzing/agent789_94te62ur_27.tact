struct WithDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultOptStructTest {
    s: WithDefaultOpt;

    init() {
        self.s = WithDefaultOpt{};
    }
}
