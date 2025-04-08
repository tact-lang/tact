struct DefaultTest {
    n: Int = 5;
    b: Bool = true;
    s: String = "val";
}

contract DefaultsStructContract {
    test: DefaultTest;

    init() {
        self.test = DefaultTest{};
    }
}
