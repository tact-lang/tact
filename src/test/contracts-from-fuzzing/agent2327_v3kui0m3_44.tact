struct DefaultsOptMix {
    a: Int = 42;
    b: Bool? = null;
    c: String = "abc";
    d: String? = null;
}

contract DefaultsOptMixContract {
    s: DefaultsOptMix;

    init() {
        self.s = DefaultsOptMix{};
    }
}
