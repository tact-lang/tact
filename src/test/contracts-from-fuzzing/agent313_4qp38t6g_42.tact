struct OptionalIntDefault {
    val: Int? = null;
}

contract OptionalIntDefaultContract {
    data: OptionalIntDefault;

    init() {
        self.data = OptionalIntDefault{};
    }
}