struct InnerExotic {
    s: String? = null;
    b: Bool? = false;
}

contract ExoticNestedDefaults {
    f: InnerExotic;

    init() {
        self.f = InnerExotic{};
    }
}