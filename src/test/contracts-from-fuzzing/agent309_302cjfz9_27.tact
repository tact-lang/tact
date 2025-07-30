struct OptionalDefault {
    foo: Int? = null;
    bar: String? = null;
}

contract OptionalDefaultTest {
    val: OptionalDefault;

    init() {
        self.val = OptionalDefault{};
    }
}