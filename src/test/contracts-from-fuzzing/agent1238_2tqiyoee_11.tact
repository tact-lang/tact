struct DefaultVals {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefaultsTest {
    d: DefaultVals;

    init() {
        self.d = DefaultVals{};
    }
}