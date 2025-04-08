struct DefaultTest {
    a: Int = 5;
    b: Bool = true;
    c: String = "test";
}

contract InitDef {
    d: DefaultTest;
    init() {
        self.d = DefaultTest{};
    }
}