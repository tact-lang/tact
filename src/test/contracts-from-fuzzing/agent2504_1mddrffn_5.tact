struct WithOptional {
    a: Int;
    b: String?;
}

contract OptionalStructTest {
    s: WithOptional?;

    init() {
        self.s = null;
    }
}
