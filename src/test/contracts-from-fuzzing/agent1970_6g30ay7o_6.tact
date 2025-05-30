struct OptionalWithDefault {
    value: Int? = null;
    label: String = "default";
}

contract OptDefTest {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{};
    }
}