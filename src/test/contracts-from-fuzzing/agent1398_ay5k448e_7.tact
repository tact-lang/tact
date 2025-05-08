struct DefaultVals {
    a: Int = 1;
    b: Bool = false;
    c: Int?;
}

contract DefaultsTest {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}