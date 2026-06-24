struct SDefaultOpt {
    optionalNum: Int? = null;
    optionalStr: String? = null;
}

contract WithDefaultsOpt {
    data: SDefaultOpt;

    init() {
        self.data = SDefaultOpt{};
    }
}