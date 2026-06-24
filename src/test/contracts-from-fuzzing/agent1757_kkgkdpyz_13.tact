struct OptionalAndDefaults {
    opt1: Int? = null;
    opt2: Bool? = null;
    val1: Int = 0;
    val2: Bool = false;
}

contract OptDefaultsContract {
    data: OptionalAndDefaults;

    init() {
        self.data = OptionalAndDefaults{};
    }
}