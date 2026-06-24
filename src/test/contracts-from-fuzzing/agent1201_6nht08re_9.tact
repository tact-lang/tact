struct OptionalAndDefault {
    foo: Int? = null;
    bar: Bool? = null;
}

contract OptionalDefaultsTest {
    thing: OptionalAndDefault;

    init() {
        self.thing = OptionalAndDefault{};
    }
}