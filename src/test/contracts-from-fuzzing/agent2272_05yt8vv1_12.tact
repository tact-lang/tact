struct ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
}

contract ManyDefaultsContract {
    data: ManyDefaults;

    init() {
        self.data = ManyDefaults{};
    }
}