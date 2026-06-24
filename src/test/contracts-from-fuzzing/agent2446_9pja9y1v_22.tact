struct DefaultMix {
    a: Int = 0;
    b: Bool;
    c: String = "x";
}

contract MixDefaults2 {
    f: DefaultMix;

    init() {
        self.f = DefaultMix{b:true};
    }
}