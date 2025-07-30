struct DefaultValsTest {
    x: Int = 99;
    y: Int?;
    z: String = "hello";
}

contract TestContract {
    data: DefaultValsTest;

    init() {
        self.data = DefaultValsTest{};
    }
}