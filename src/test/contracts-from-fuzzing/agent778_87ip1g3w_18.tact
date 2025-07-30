struct MixDeep {
    a: Int = 5;
    b: Bool = false;
}

contract DeepWithDefaults {
    val: MixDeep;
    init() {
        self.val = MixDeep{};
    }
}