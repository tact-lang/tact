struct OptionalWithDefault {
    o: Int? = null;
}

contract OptionalDefaultContract {
    d: OptionalWithDefault;
    init() {
        self.d = OptionalWithDefault{};
    }
}