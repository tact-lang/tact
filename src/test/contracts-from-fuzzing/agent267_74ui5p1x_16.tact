struct SDefaultOpt {
    x: Int?;
}

contract OptDefaults {
    s: SDefaultOpt;

    init() {
        self.s = SDefaultOpt{};
    }
}