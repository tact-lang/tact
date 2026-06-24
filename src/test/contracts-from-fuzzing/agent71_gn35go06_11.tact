struct OptionalWithDefault {
    val: Int? = null;
}

contract TestContract {
    data: OptionalWithDefault;

    init() {
        self.data = OptionalWithDefault{};
    }
}