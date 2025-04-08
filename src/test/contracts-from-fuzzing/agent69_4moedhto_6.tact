struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "default";
}

contract DefaultStructTest {
    data: DefaultVals;

    init() {
        self.data = DefaultVals{};
    }
}