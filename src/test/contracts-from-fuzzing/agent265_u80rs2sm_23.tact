struct DefaultVals {
    one: Int = 4;
    two: Bool = true;
    three: String = "hi";
}

contract DefaultsTest {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }

    receive() {
        self.data = self.data;
    }
}