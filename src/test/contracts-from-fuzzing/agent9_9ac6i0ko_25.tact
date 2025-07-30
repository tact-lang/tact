struct SDefault {
    val: Int = 17;
    flag: Bool = true;
}

contract ContractInitOverride {
    s: SDefault = SDefault{};

    init() {
        self.s = SDefault{ val: 999, flag: false };
    }
}