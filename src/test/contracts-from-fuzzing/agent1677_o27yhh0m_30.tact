struct SDefaultOpt {
    optInt: Int? = null;
    optBool: Bool? = null;
}

contract StructWithOptDefaults {
    data: SDefaultOpt;

    init() {
        self.data = SDefaultOpt{};
    }
}