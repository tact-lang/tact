struct DefaultOpt {
    a: Int = 0;
    b: String?; // implicit null
    c: Bool = true;
    d: Slice?; // implicit null
}

contract DefaultsMix {
    mix: DefaultOpt;

    init() {
        self.mix = DefaultOpt{};
    }
}
