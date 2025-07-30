struct SDefaultOpt {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
}

contract DefaultsOnOptionals {
    data: SDefaultOpt;

    init() {
        self.data = SDefaultOpt{};
    }
}