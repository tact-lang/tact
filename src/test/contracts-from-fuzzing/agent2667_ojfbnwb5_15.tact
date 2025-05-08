struct OptionalStructWithEmptyDefaults {
    val: Int? = null;
}

contract OptionalDefaultTest {
    data: OptionalStructWithEmptyDefaults;

    init() {
        self.data = OptionalStructWithEmptyDefaults{};
    }

    receive() {
        self.data = OptionalStructWithEmptyDefaults{val: 123};
    }
}