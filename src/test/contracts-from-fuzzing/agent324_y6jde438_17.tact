struct OptionalMix {
    i: Int?;
    b: Bool?;
    s: String?;
}

contract OptionalMixContract {
    f1: OptionalMix;
    f2: OptionalMix?;
    f3: Bool?;

    init() {
        self.f1 = OptionalMix{i:1, b:true, s:"x"};
        self.f2 = null;
        self.f3 = false;
    }
}