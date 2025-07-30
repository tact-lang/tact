struct InitDefaultsNested {
    s: String = "Hi";
    n: Int = 77;
    b: Bool = false;
}

contract InitDefaultsTest {
    nested: InitDefaultsNested;

    init() {
        self.nested = InitDefaultsNested{};
    }
}