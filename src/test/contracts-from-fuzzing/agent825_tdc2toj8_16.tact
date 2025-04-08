struct OptDefaults {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefOptTest {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{};
    }
}