struct DefaultVals {
    a: Int = 0;
    b: Bool = true;
    c: String = "test";
}

contract DefaultTest {
    s: DefaultVals;

    init() {
        self.s = DefaultVals{};
    }
}