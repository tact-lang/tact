struct OptionalDefault {
    s: String?;
}

contract OptionalDefaultsTest {
    f: OptionalDefault;

    init() {
        self.f = OptionalDefault{
            s: null
        };
    }
}
