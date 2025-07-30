struct SBoolDefault {
    b: Bool = true;
}

contract StructDefaultBool {
    s: SBoolDefault;

    init() {
        self.s = SBoolDefault{};
    }
}
