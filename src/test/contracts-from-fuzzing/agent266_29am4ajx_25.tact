struct OptWithDefaults {
    foo: Int? = null;
    bar: Bool? = null;
}

contract OptDefaultsTest {
    data: OptWithDefaults;

    init() {
        self.data = OptWithDefaults{
            foo: null,
            bar: true
        };
    }
}