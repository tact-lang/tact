struct DefaultVals {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
}

contract DefaultTest {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}