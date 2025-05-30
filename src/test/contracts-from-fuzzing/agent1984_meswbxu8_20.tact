struct OptionalStringDefault {
    s: String? = null;
    n: Int = 7;
}

contract StrDefaultOpt {
    f: OptionalStringDefault;

    init() {
        self.f = OptionalStringDefault{};
    }
}