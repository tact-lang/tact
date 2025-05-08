struct InlineInit {
    a: Int = 1;
    b: Bool = false;
    c: String = "foo";
}

contract InlineDefaultTest {
    s: InlineInit;

    init() {
        self.s = InlineInit{};
    }
}
