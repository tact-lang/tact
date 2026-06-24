struct SBoolOpt {
    x: Bool?;
    y: Bool?;
}

contract OnlyBoolOptionals {
    f: SBoolOpt;
    init() {
        self.f = SBoolOpt{x: null, y: true};
    }
}