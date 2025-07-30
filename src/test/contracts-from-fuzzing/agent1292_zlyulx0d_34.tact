struct ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = false;
    d: String = "s";
    e: String? = null;
}

contract ManyDefaultsContract {
    rec: ManyDefaults;

    init() {
        self.rec = ManyDefaults{};
    }
}