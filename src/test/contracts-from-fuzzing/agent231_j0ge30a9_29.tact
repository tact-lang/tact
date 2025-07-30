struct MixedDefaults {
    a: Int = 3;
    b: Bool;
    c: Int?;
    d: Bool? = null;
}

contract MixedPersistentDefaults {
    s: MixedDefaults;

    init() {
        self.s = MixedDefaults{ b: true, c: null };
    }
}