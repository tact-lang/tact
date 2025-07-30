struct SWithStrDefault {
    txt: String = "default";
}

contract StrDefaults {
    s: SWithStrDefault;
    init() {
        self.s = SWithStrDefault{};
    }
}