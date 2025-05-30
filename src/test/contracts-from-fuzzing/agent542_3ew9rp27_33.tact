struct OptionalIntDefault {
    val: Int? = null;
}

contract TestContract {
    d: OptionalIntDefault;

    init() {
        self.d = OptionalIntDefault{};
    }
}