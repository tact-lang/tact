struct OptionalInNested {
    f1: Int;
    f2: Bool?;
}

contract MixedDeepOptionals {
    rec: OptionalInNested?;

    init() {
        self.rec = OptionalInNested{ f1: 1, f2: null };
    }
}
