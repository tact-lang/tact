struct MixedDefaultsOpt {
    v1: Int = 7;
    v2: Bool?;
    v3: Address? = null;
    v4: String = "hi";
}

contract MixedDefaults {
    fld: MixedDefaultsOpt;
    init() {
        self.fld = MixedDefaultsOpt{ v2: true };
    }
}