struct OptionDefaultMix {
    a: Int? = 3;
    b: Bool? = true;
    s: String? = null;
}

contract OptDefaultMixTest {
    val: OptionDefaultMix;
    init() {
        self.val = OptionDefaultMix{};
    }
}