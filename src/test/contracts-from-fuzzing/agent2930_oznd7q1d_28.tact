struct DefaultsMix {
    i: Int = 7;
    s: String = "x";
    b: Bool = true;
}

contract DefaultsOfAll {
    f: DefaultsMix;

    init() {
        self.f = DefaultsMix{};
    }
}
