struct WithDefaults {
    a: Int = 1;
    b: String = "x";
    c: Bool = true;
    d: Int?; // defaults to null
}

contract Test {
    w: WithDefaults;

    init() {
        self.w = WithDefaults{};
    }

    receive() {
        let _ = self.w.a + (self.w.c ? 1 : 0);
    }
}
