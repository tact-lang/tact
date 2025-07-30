struct DefaultsTest {
    a: Int = 5;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefaultsStorage {
    s: DefaultsTest;

    init() {
        self.s = DefaultsTest{};
    }
}