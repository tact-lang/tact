struct Defaults {
    foo: Int = 5;
    bar: Bool = true;
}

contract OptStructDefaults {
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;
    optStruct: Defaults? = null;
    normStruct: Defaults = Defaults{};

    init() {
        // leave defaults
    }
}