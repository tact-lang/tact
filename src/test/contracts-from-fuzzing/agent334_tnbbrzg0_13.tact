struct DefaultsNested {
    x: Int = 5;
    y: String = "abc";
    z: Bool = false;
}
contract DefaultsTest {
    field: DefaultsNested;

    init() {
        self.field = DefaultsNested{};
    }
}