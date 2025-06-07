struct Defaulted {
    foo: Int = 777;
    bar: Int?;
}

contract DefaultsTest {
    d: Defaulted;

    init() {
        self.d = Defaulted{};
    }
}
