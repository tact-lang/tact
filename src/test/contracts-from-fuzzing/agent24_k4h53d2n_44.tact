struct DefaultMix {
    a: Int = 1;
    b: Bool = false;
    s: String = "hi";
}

contract DefaultMixContract {
    d: DefaultMix;

    init() {
        self.d = DefaultMix{};
    }
}