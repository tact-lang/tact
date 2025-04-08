struct OptionalWithDefault {
    x: Int? = null;
}

contract OptionalFieldDefault {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{};
    }
}