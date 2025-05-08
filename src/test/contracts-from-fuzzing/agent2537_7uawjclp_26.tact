struct BoolDefault {
    yes: Bool = true;
    no: Bool = false;
}

contract BoolDefaultsStore {
    flags: BoolDefault;
    init() {
        self.flags = BoolDefault{};
    }
}