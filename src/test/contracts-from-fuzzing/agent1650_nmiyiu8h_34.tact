struct HasBoolDefault {
    flag: Bool = true;
}

contract StructWithBoolDef {
    d: HasBoolDefault;

    init() {
        self.d = HasBoolDefault{};
    }
}