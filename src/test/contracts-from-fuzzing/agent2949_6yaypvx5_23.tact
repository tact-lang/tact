struct MixOption {
    i: Int?;
    b: Bool?;
    s: String?;
    a: Address?;
}

contract ManyMixOpt {
    one: MixOption;

    init() {
        self.one = MixOption{ i: null, b: null, s: null, a: null };
    }
}
