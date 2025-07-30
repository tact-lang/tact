struct DefaultOptMix {
    i: Int = 1;
    j: Int? = null;
    b: Bool = true;
    s: String = "foo";
    bb: Bool? = null;
}

contract DefaultsMix {
    stuff: DefaultOptMix;

    init() {
        self.stuff = DefaultOptMix{};
    }
}
