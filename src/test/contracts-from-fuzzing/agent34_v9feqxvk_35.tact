struct SDefaultOpt {
    x: Int = 5;
    y: Int? = null;
}

contract DeepDefaults {
    s: SDefaultOpt;

    init() {
        self.s = SDefaultOpt{};
    }
}