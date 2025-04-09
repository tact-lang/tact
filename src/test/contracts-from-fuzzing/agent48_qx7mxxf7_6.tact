struct Defaulted {
    x: Int = 1;
    y: String = "hi";
    z: Bool = false;
}

contract DefaultsTest {
    foo: Defaulted;

    init() {
        self.foo = Defaulted{};
    }
}
