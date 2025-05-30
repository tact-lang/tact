struct MixedDefaults {
    i: Int = 5;
    b: Bool = true;
    o: Int? = null;
    s: String = "zzz";
}

contract MixedDefaultsContract {
    val: MixedDefaults;

    init() {
        self.val = MixedDefaults{};
    }
}