struct NestedOptDefaults {
    a: Int? = null;
    b: String? = null;
    c: Bool? = true;
}

contract OptDefaultTest {
    x: NestedOptDefaults;
    init() {
        self.x = NestedOptDefaults{};
    }
}