struct SDefault {
    a: Int? = null;
    b: Bool? = null;
}

contract OptionalsExplicitNull {
    val: SDefault;

    init() {
        self.val = SDefault{};
    }
}