struct DefaultsAndOpt {
    a: Int = 5;
    b: Bool?;
    c: String = "x";
}

contract DefOptMix {
    s: DefaultsAndOpt;

    init() {
        self.s = DefaultsAndOpt{b: null};
    }
}