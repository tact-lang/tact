struct EdgeOptionalDefaults {
    a: Int? = null;
    b: Bool? = null;
    s: String? = null;
}

contract EdgeOptDefaultTest {
    v: EdgeOptionalDefaults;

    init() {
        self.v = EdgeOptionalDefaults{};
    }
}