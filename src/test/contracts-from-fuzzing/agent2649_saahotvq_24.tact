struct OptionalBoolDefault {
    flag: Bool? = null;
}

contract OptBoolNullTest {
    val: OptionalBoolDefault;

    init() {
        self.val = OptionalBoolDefault{};
    }
}