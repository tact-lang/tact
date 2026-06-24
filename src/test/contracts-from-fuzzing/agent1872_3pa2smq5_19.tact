struct DefaultsOpt {
    a: Int? = 10;
    b: Bool? = true;
    s: String? = "hi";
}

contract DefaultsOnOptionals {
    st: DefaultsOpt;

    init() {
        self.st = DefaultsOpt{};
    }
}