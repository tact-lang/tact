struct OptionalWithDefault {
    a: Int? = null;
}

contract TestContract {
    val: OptionalWithDefault;

    init() {
        self.val = OptionalWithDefault{};
    }
}