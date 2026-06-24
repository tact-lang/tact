struct DefaultsNested {
    a: Int = 7;
    b: Bool = true;
}

contract StructDefaultsTest {
    val: DefaultsNested;
    init() {
        self.val = DefaultsNested{};
    }
}
