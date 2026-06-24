struct OptDefaults {
    x: Int? = null;
    y: String? = null;
}

contract OptDefaultsTest {
    data: OptDefaults;

    init() {
        self.data = OptDefaults{
            x: null,
            y: null
        };
    }
}
