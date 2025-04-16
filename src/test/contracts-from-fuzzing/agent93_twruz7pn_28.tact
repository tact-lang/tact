struct OptBools {
    yes: Bool? = true;
    no: Bool? = false;
    none: Bool?;
}

contract OptBoolDefaults {
    flags: OptBools;

    init() {
        self.flags = OptBools{};
    }
}