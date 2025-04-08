struct OptMix {
    f1: Int?;
    f2: Bool;
    f3: String?;
    f4: Bool?;
}

contract MixOptional {
    state: OptMix;

    init() {
        self.state = OptMix{
            f1: null,
            f2: true,
            f3: null,
            f4: null
        };
    }

    receive() {
        self.state.f1 = 11;
        self.state.f3 = "foo";
        self.state.f4 = true;
    }
}