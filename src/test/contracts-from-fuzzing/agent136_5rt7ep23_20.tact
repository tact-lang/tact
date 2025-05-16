struct OptionalDefaultsMix {
    a: Int? = null;
    b: Bool? = false;
    c: Address? = null;
    d: String? = "hello";
}

contract MixOptDef {
    f: OptionalDefaultsMix;

    init() {
        self.f = OptionalDefaultsMix{};
    }
}