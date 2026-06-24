struct DefaultsEverywhere {
    a: Int = 1;
    b: Bool = true;
    c: String = "s";
    d: Address? = null;
    e: Int? = null;
}

contract DefaultsStructOverride {
    data: DefaultsEverywhere;
    init() {
        self.data = DefaultsEverywhere{};
    }
}