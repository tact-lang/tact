struct DefaultTest {
    a: Int = 42;
    b: Bool = true;
    c: String = "hello";
}

contract Test19 {
    dt: DefaultTest;
    init() {
        self.dt = DefaultTest{};
    }
}
