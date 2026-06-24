struct DefaultMix {
    a: Int = 10;
    b: Bool?;
    c: String = "default";
}

contract DefaultMixContract {
    dm: DefaultMix;

    init() {
        self.dm = DefaultMix{b: true};
    }
}