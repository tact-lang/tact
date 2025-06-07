struct MixedDefaults {
    intVal: Int = 5;
    optInt: Int? = null;
    boolVal: Bool = false;
    optStr: String? = null;
}

contract MixedDefaultsContract {
    data: MixedDefaults;

    init() {
        self.data = MixedDefaults{};
    }
}