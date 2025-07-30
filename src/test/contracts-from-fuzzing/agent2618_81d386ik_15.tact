struct Defaulted {
    foo: Int = 7;
    bar: Bool = false;
    baz: String = "hi";
}

contract DefaultsTest {
    def: Defaulted;

    init() {
        self.def = Defaulted{};
    }
}