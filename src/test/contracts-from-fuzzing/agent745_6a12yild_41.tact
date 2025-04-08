struct BoolOptMix {
    a: Bool = false;
    b: Bool? = null;
    c: Bool = true;
    d: Bool? = null;
}

contract BoolMixDefaults {
    val: BoolOptMix;

    init() {
        self.val = BoolOptMix{};
    }
}