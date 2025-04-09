struct OptionalWithDefault {
    x: Int? = null;
    y: Bool? = true;
    z: String? = null;
}

contract OptionalWithDefaultTest {
    val: OptionalWithDefault;

    init() {
        self.val = OptionalWithDefault{};
    }
}