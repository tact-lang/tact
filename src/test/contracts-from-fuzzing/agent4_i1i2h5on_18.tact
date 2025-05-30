// Check optional field with default value explicitly null
struct DefOpt {
    f1: Int? = null;
    f2: Bool? = null;
}

contract TestContract {
    def: DefOpt;

    init() {
        self.def = DefOpt{};
    }
}
