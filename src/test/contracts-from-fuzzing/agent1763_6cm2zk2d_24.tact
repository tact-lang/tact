struct OptDefault {
    optional: Int? = null;
    optionalBool: Bool? = null;
}

contract TestContract {
    val: OptDefault;

    init() {
        self.val = OptDefault{};
    }
}