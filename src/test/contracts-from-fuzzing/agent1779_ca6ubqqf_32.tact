struct BigOptDefaults {
    a: Int? = null; b: Int? = null; c: Int? = null;
    d: Int? = null; e: Int? = null; f: Int? = null;
}

contract MassOptDefaults {
    data: BigOptDefaults;
    init() {
        self.data = BigOptDefaults{};
    }
}