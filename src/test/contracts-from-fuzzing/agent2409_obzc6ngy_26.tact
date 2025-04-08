struct Defaulted {
    a: Int = 123;
    b: Bool = true;
    c: String = "hi";
}

contract StructDefaultsTest {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}