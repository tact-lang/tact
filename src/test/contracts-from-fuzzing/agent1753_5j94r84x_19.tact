struct NestedDefaults {
    a: Int = 11;
    b: Bool = false;
    s: String?;
}

contract NestedDefTest {
    data: NestedDefaults;
    init() {
        self.data = NestedDefaults{};
    }
}
