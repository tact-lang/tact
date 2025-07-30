struct FlagsOpt {
    f1: Bool? = null;
    f2: Bool? = true;
    f3: Bool? = null;
}

contract TestC {
    flagsOpt: FlagsOpt;

    init() {
        self.flagsOpt = FlagsOpt{};
    }
}