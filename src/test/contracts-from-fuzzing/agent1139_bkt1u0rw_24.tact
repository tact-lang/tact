struct OptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
}

contract MixNestedOptionals {
    s: OptionalMix?;
    s2: OptionalMix;

    init() {
        self.s = null;
        self.s2 = OptionalMix{ a: null, b: null, c: null, d: null, e: null, f: null };
    }
}