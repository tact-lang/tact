struct Defaulted {
    a: Int = 1;
    b: Int = 2;
    c: Bool = true;
    d: String = "foo";
}

contract DefaultsTest {
    s: Defaulted;

    init() {
        self.s = Defaulted{};
    }
}