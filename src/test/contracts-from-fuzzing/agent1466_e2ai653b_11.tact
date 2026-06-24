struct DefaultExample {
    a: Int = 1;
    b: String = "abc";
    c: Bool = false;
}

contract DefaultTest {
    def: DefaultExample;

    init() {
        self.def = DefaultExample{};
    }
}
