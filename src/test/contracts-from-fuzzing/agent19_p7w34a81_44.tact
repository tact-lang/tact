struct MixDefaults {
    intVal: Int = 10;
    optStr: String? = null;
    flag: Bool = false;
}

contract MixedDefaults {
    f: MixDefaults;

    init() {
        self.f = MixDefaults{};
    }
}