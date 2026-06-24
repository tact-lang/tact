struct Defaulted {
    x: Int = 99;
    y: Bool = false;
    z: String = "abc";
}

contract StructWithDefaultsTest {
    data: Defaulted;

    init() {
        self.data = Defaulted{};
    }
}