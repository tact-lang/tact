struct SDefaultedOpt {
    a: Int? = null;
    b: Bool? = null;
}

contract StructWithDefaultedOpts {
    val: SDefaultedOpt;

    init() {
        self.val = SDefaultedOpt{};
    }
}