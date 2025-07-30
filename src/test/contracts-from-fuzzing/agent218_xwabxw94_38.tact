struct MixSetup {
    number: Int = 42;
    text: String = "λ";
    optNull: Int?;
    optHas: Bool?;
}

contract MixComplex {
    ms: MixSetup;

    init() {
        self.ms = MixSetup{ optNull: null, optHas: true };
    }
}