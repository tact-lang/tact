struct MultiDefaults {
    a: Int = 1;
    b: Bool = false;
    s: String = "x";
}

contract DefaultsStruct {
    m: MultiDefaults;

    init() {
        self.m = MultiDefaults{};
    }
}
