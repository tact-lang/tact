struct DefaultsWithOptionals {
    i: Int? = null;
    b: Bool? = null;
    s: String? = null;
    c: Cell? = null;
    a: Address? = null;
}

contract OptionalsDefaultsTest {
    data: DefaultsWithOptionals;
    init() {
        self.data = DefaultsWithOptionals{};
    }
}